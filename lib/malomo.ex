defmodule Malomo do
  @type response_t :: { :ok, Malomo.Response.t() } | { :error, any }

  @doc """
  Make a request to the Malomo API
  """
  @spec request(Malomo.Operation.t(), map) :: response_t
  def request(operation, config \\ %{}) do
    config = Malomo.Config.new(config)

    Malomo.Operation.perform(operation, config)
  end
end
