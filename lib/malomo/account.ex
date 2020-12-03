defmodule Malomo.Account do
  alias  Malomo.{ Operation }

  @doc """
  Retrieve information for the current account.
  """
  @spec get :: Operation.t()
  def get do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/accounts/self")
  end
end
