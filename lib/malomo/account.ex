defmodule Malomo.Account do
  @doc """
  Retrieve the account associated with the API key used.
  """
  @spec get :: Malomo.Operation.t()
  def get do
    %Malomo.Operation{
      method: :get,
      path: "/accounts/self"
    }
  end
end
