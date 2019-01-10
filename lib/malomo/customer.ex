defmodule Malomo.Customer do
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/customers"
    }
  end

  @spec delete(binary) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      action: :delete,
      path: "/customers/#{id}"
    }
  end

  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/customers/#{id}"
    }
  end

  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      action: :put,
      params: params,
      path: "/customers/#{id}"
    }
  end
end
