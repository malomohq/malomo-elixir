defmodule Malomo.Helpers.Headers do
  @moduledoc false

  alias Malomo.{ Config }

  @spec new(Config.t()) :: Malomo.http_headers_t()
  def new(config) do
    []
    ++ [{ "content-type", "application/json" }]
    ++ [{ "authorization", "Bearer #{config.api_key}" }]
    ++ config.headers
  end
end
