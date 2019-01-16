defmodule Malomo.Order do
  @doc """
  Create an order.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      action: :post,
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
      action: :delete,
      path: "/orders/#{id}"
    }
  end

  @doc """
  Retrieve a single order.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/orders/#{id}"
    }
  end

  @doc """
  Retrieve a list of orders.
  """
  @spec list(map) :: Malomo.Operation.t()
  def list(params \\ %{}) do
    %Malomo.Operation{
      action: :get,
      params: params,
      path: "/orders"
    }
  end
end
