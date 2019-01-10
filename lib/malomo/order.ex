defmodule Malomo.Order do
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/orders"
    }
  end

  @spec delete(binary) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      action: :delete,
      path: "/orders/#{id}"
    }
  end

  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/orders/#{id}"
    }
  end

  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      action: :put,
      params: params,
      path: "/orders/#{id}"
    }
  end
end
