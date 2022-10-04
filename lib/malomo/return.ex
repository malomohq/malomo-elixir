defmodule Malomo.Return do
  alias Malomo.Operation

  @doc """
  Create a return.
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/returns")
  end
end
