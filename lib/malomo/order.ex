defmodule Malomo.Order do
  alias Malomo.{ Operation }

  @doc """
  Create a order.
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/orders")
  end

  @doc """
  Creates an event for an order.
  """
  @spec create_event(String.t(), Keyword.t()) :: Operation.t()
  def create_event(order_id, opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/orders/#{order_id}/events")
  end

  @doc """
  Delete a order.
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/orders/#{id}")
  end

  @doc """
  Retrieve a order.
  """
  @spec get(String.t()) :: Operation.t()
  def get(id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/orders/#{id}")
  end

  @doc """
  Retrieve a list of events for a order.
  """
  @spec get_events(String.t(), Keyword.t()) :: Operation.t()
  def get_events(id, opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/orders/#{id}/events")
  end

  @doc """
  Retrieve a list of orders.
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/orders")
  end

  @doc """
  Update a order.
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/orders/#{id}")
  end
end
