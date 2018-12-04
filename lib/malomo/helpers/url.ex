defmodule Malomo.Helpers.URL do
  def build(operation, config) do
    %URI{
      host: config.host,
      path: operation.path,
      port: config.port,
      scheme: config.scheme
    }
    |> put_query(operation)
    |> URI.to_string()
  end

  #
  # private
  #

  defp put_query(uri, %{ action: :get } = operation) do
    Map.put(uri, :query, URI.encode_query(operation.params))
  end

  defp put_query(uri, _operation) do
    uri
  end
end
