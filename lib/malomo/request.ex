defmodule Malomo.Request do
  alias Malomo.{ Config, Helpers, Operation, Response }

  @type t ::
          %__MODULE__{
            body: String.t(),
            headers: Malomo.http_headers_t(),
            method: Malomo.http_method_t(),
            private: map,
            url: String.t()
          }

  defstruct [
    body: nil,
    headers: [],
    method: nil,
    private: %{},
    url: nil
  ]

  @spec new(Operation.t(), Config.t()) :: t
  def new(operation, config) do
    body = Helpers.Body.encode!(operation, config)

    headers = []
    headers = headers ++ [{ "accept", "application/vnd.malomo+json; version=2" }]
    headers = headers ++ [{ "authorization", "Bearer #{config.access_token}" }]
    headers = headers ++ Helpers.Headers.content_type(operation)
    headers = headers ++ config.http_headers

    url = Helpers.Url.to_string(operation, config)

    %__MODULE__{}
    |> Map.put(:body, body)
    |> Map.put(:headers, headers)
    |> Map.put(:method, operation.method)
    |> Map.put(:url, url)
  end

  @spec send(t, Config.t()) :: Malomo.http_response_t()
  def send(request, config) do
    attempt = Map.get(request.private, :attempt, 0)

    attempt = attempt + 1

    private = Map.put(request.private, :attempt, attempt)

    request = Map.put(request, :private, private)

    request
    |> config.http_client.send(config.http_client_opts)
    |> retry(request, config)
    |> finish(config)
  end

  defp retry(response, _request, %_{ retry: retry }) when is_nil(retry) or retry == false do
    response
  end

  defp retry({ :ok, %{ status_code: status_code } } = response, request, config) when status_code >= 500 do
    do_retry(response, request, config)
  end

  defp retry({ :error, _ } = response, request, config) do
    do_retry(response, request, config)
  end

  defp retry(response, _request, _config) do
    response
  end

  defp do_retry(response, request, config) do
    attempt = Map.get(request.private, :attempt)

    max_attempts = Keyword.get(config.retry_opts, :max_attempts, 3)

    if max_attempts > attempt do
      seconds_to_wait = config.retry.wait_for(request, config)

      :timer.sleep(seconds_to_wait)

      __MODULE__.send(request, config)
    else
      response
    end
  end

  defp finish(response, config) do
    case response do
      { :ok, %{ status_code: status_code } = response } when status_code >= 400 ->
        { :error, Response.new(response, config) }
      { :ok, %{ status_code: status_code } = response } when status_code >= 200 ->
        { :ok, Response.new(response, config) }
      otherwise ->
        otherwise
    end
  end
end
