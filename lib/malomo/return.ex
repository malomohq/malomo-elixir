defmodule Malomo.Return do
  alias Malomo.Operation

  @doc """
  Create a Return.
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/returns")
  end

  @doc """
  Retrieve a Return.
  """
  @spec get(binary()) :: Operation.t()
  def get(id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/returns/#{id}")
  end

  @doc """
  Retrieve a Return by a third-party alternate id.
  """
  @spec get_by_alternate_id(binary()) :: Operation.t()
  def get_by_alternate_id(alternate_id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, [alternate_id: alternate_id])
    |> Map.put(:path, "/returns")
  end

  @doc """
  Update a Return.
  """
  @spec update(binary(), Keyword.t()) :: Operation.t()
  def update(id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/returns/#{id}")
  end
end
