defmodule Malomo.Helpers.Body do
  @moduledoc false

  alias Malomo.{ Config, Operation }

  @spec encode!(Operation.t(), Config.t()) :: String.t()
  def encode!(%_{ method: method }, _config)
      when method == :delete or method == :get do
    ""
  end

  def encode!(%_{ encoding: :www_form_urlencoded } = operation, _config) do
    operation.params
    |> Enum.into(%{})
    |> URI.encode_query()
  end

  def encode!(operation, config) do
    operation.params
    |> Enum.into(%{})
    |> config.json_codec.encode!()
  end
end
