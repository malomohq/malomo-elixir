defmodule Malomo.HTTP.Hackney do
  @behaviour Malomo.HTTP

  @spec request(Malomo.Request.t(), any)
          :: { :ok, Malomo.HTTP.response_t() } | { :error, any }
  def request(request, opts) do
    opts = opts ++ [:with_body]

    response =
      :hackney.request(
        request.method,
        request.url,
        request.headers,
        request.body,
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
