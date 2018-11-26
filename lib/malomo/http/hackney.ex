defmodule Malomo.HTTP.Hackney do
  @behaviour Malomo.HTTP

  @spec request(binary, binary, [{binary, binary}], binary, any) ::
          { :ok, Malomo.HTTP.response_t() } | { :error, any }
  def request(method, url, headers, body, opts) do
    opts = opts ++ [:with_body]

    response =
      :hackney.request(
        method,
        url,
        headers,
        body,
        opts
      )

    serialize_response(response)
  end

  defp serialize_response({ :ok, status_code, headers }) do
    response = %{ body: "", headers: headers, status_code: status_code }

    { :ok, response }
  end

  defp serialize_response({ :ok, status_code, headers, body }) do
    response = %{ body: body, headers: headers, status_code: status_code }

    { :ok, response }
  end

  defp serialize_response(otherwise) do
    otherwise
  end
end
