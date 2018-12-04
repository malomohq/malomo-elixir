defmodule Malomo.Tracker do
  @spec create(binary, map) :: Malomo.Operation.t()
  def create(order_id, params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/orders/#{order_id}/trackers"
    }
  end
end
