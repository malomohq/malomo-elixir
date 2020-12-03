defmodule Malomo.Customer do
  alias Malomo.{ Operation }

  @doc """
  Create a customer.
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers")
  end

  @doc """
  Delete a customer.
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/customers/#{id}")
  end

  @doc """
  Retrieve a customer.
  """
  @spec get(String.t()) :: Operation.t()
  def get(id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/customers/#{id}")
  end

  @doc """
  Retrieve a list of events for a customer.
  """
  @spec get_events(String.t(), Keyword.t()) :: Operation.t()
  def get_events(id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers/#{id}/events")
  end

  @doc """
  Retrieve a list of customers.
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers")
  end

  @doc """
  Update a customer.
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/customers/#{id}")
  end
end
