defmodule Malomo.Helpers.URL do
  @moduledoc false

  alias Malomo.{ Config, Operation }

  @spec to_string(Operation.t(), Config.t()) :: String.t()
  def to_string(operation, config) do
    operation
    |> to_uri(config)
    |> URI.to_string()
  end

  @spec to_uri(Operation.t(), Config.t()) :: URI.t()
  def to_uri(operation, config) do
    %URI{
      host: config.host,
      path: "#{config.path}#{operation.path}",
      port: config.port,
      scheme: config.scheme
    }
  end
end
