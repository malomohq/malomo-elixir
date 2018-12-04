defmodule Malomo.Helpers.JSON do
  def decode(string, config) do
    case config.json_codec.decode(string) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        %{}
    end
  end

  def encode(map, config) do
    case config.json_codec.encode(map) do
      { :ok, result } ->
        result
      { :error, _reason } ->
        ""
    end
  end
end
