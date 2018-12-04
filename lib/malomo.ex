defmodule Malomo do
  def request(operation, config \\ %{}) do
    config = Malomo.Config.new(config)

    Malomo.Operation.perform(operation, config)
  end
end
