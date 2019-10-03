defmodule Malomo.Shipment do
  @doc """
  Create a shipment.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      method: :post,
      params: params,
      path: "/shipments"
    }
  end
  
  @doc """
  Delete a shipment.
  """
  @spec delete(String.t()) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      method: :delete,
      path: "/shipments/#{id}"
    }
  end

  @doc """
  Retrieve a single shipment.
  """
  @spec find(String.t()) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      method: :get,
      path: "/shipments/#{id}"
    }
  end

  @doc """
  Retrieve the customer associated with a shipment.
  """
  @spec get_customer(String.t()) :: Malomo.Operation.t()
  def get_customer(id) do
    %Malomo.Operation{
      method: :get,
      path: "/shipments/#{id}/customers"
    }
  end

  @doc """
  Retrieve the order associated with a shipment.
  """
  @spec get_order(String.t()) :: Malomo.Operation.t()
  def get_order(id) do
    %Malomo.Operation{
      method: :get,
      path: "/shipments/#{id}/orders"
    }
  end

  @doc """
  Update a shipment.
  """
  @spec update(String.t(), map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      method: :put,
      params: params,
      path: "/shipments/#{id}"
    }
  end
end
