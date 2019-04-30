defmodule Malomo.Shipment do
  @doc """
  Create a shipment.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/shipments"
    }
  end

  @doc """
  Retrieve a single shipment.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/shipments/#{id}"
    }
  end

  @doc """
  Retrieve the customer associated with a shipment.
  """
  @spec get_customer(binary) :: Malomo.Operation.t()
  def get_customer(id) do
    %Malomo.Operation{
      action: :get,
      path: "/shipmens/#{id}/customers"
    }
  end

  @doc """
  Retrieve the order associated with a shipment.
  """
  @spec get_order(binary) :: Malomo.Operation.t()
  def get_order(id) do
    %Malomo.Operation{
      action: :get,
      path: "/shipments/#{id}/orders"
    }
  end

  @doc """
  Update a shipment.
  """
  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      action: :put,
      params: params,
      path: "/shipments/#{id}"
    }
  end
end
