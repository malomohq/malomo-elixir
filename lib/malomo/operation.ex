defmodule Malomo.Operation do
  @type action_t :: :delete | :get | :post | :put

  @type t :: %__MODULE__{ action: action_t, params: map, path: binary }

  defstruct [action: nil, params: %{}, path: nil]

  def perform(operation, config) do
    case make_request(operation, config) do
      { :ok, response } ->
        handle_response(response, config)
      otherwise ->
        otherwise
    end
  end

  #
  # private
  #

  defp make_request(operation, config) do
    body = Malomo.Helpers.Request.build_body(operation, config)
    headers = Malomo.Helpers.Request.build_headers(config)
    url = Malomo.Helpers.Request.build_url(operation, config)

    config.http_client.request(
      operation.action,
      url,
      headers,
      body,
      config.http_client_opts
    )
  end

  defp handle_response(response, config) do
    body =
      response
      |> Map.get(:body)
      |> Malomo.Helpers.JSON.decode(config)

    package_response(
      %Malomo.Response{
        body: body,
        headers: Map.get(response, :headers),
        status_code: Map.get(response, :status_code)
      }
    )
  end

  defp package_response(%{ status_code: status_code } = response)
       when status_code < 400
  do
    { :ok, response }
  end

  defp package_response(response) do
    { :error, response }
  end
end
