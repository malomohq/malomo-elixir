defmodule Malomo.Tracker do
  @doc """
  Create a tracker.
  """
  @spec create(binary, map) :: Malomo.Operation.t()
  def create(order_id, params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/orders/#{order_id}/trackers"
    }
  end

  @doc """
  Retrieve a single tracker.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/trackers/#{id}"
    }
  end
end
