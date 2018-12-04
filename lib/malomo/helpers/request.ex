defmodule Malomo.Helpers.Request do
  def build_body(%{ action: :get }, _config) do
    ""
  end

  def build_body(operation, config) do
    Malomo.Helpers.JSON.encode(operation.params, config)
  end

  def build_headers(config) do
    [
      {"authorization", "Bearer #{config.api_key}"},
      {"content-type", "application/json"}
    ]
  end

  def build_url(operation, config) do
    %URI{
      host: config.host,
      path: config.path <> operation.path,
      port: config.port,
      scheme: config.scheme
    }
    |> put_query(operation)
    |> URI.to_string()
  end

  defp put_query(uri, %{ action: :get } = operation) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, _operation) do
    uri
  end
end
