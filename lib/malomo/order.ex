defmodule Malomo.Order do
  @doc """
  Add a customer to an order.
  """
  @spec add_customer(binary, binary) :: Malomo.Operation.t()
  def add_customer(order_id, customer_id) do
    %Malomo.Operation{
      method: :post,
      path: "/orders/#{order_id}/customers/#{customer_id}"
    }
  end

  @doc """
  Create an order.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      method: :post,
      params: params,
      path: "/orders"
    }
  end

  @doc """
  Delete an order.
  """
  @spec delete(binary) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      method: :delete,
      path: "/orders/#{id}"
    }
  end

  @doc """
  Retrieve a single order.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      method: :get,
      path: "/orders/#{id}"
    }
  end

  @doc """
  Retrieve a list of orders.
  """
  @spec list(map) :: Malomo.Operation.t()
  def list(params \\ %{}) do
    %Malomo.Operation{
      method: :get,
      params: params,
      path: "/orders"
    }
  end

  @doc """
  Update an order.
  """
  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params \\ %{}) do
    %Malomo.Operation{
      method: :put,
      params: params,
      path: "/orders/#{id}"
    }
  end
end
