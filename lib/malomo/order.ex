defmodule Malomo.Order do
  @spec create(binary, map) :: Malomo.Operation.t()
  def create(customer_id, params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/customers/#{customer_id}/orders"
    }
  end
end
