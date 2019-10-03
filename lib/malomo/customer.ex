defmodule Malomo.Customer do
  @doc """
  Create a customer.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      method: :post,
      params: params,
      path: "/customers"
    }
  end

  @doc """
  Delete a customer.
  """
  @spec delete(String.t()) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      method: :delete,
      path: "/customers/#{id}"
    }
  end

  @doc """
  Retrieve a single customer.
  """
  @spec find(String.t()) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      method: :get,
      path: "/customers/#{id}"
    }
  end

  @doc """
  Retrieve a list of customers.
  """
  @spec list(map) :: Malomo.Operation.t()
  def list(params \\ %{}) do
    %Malomo.Operation{
      method: :get,
      params: params,
      path: "/customers"
    }
  end

  @doc """
  Update a customer.
  """
  @spec update(String.t(), map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      method: :put,
      params: params,
      path: "/customers/#{id}"
    }
  end
end
