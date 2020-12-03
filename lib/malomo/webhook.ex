defmodule Malomo.Webhook do
  alias Malomo.{ Operation }

  @doc """
  Create a webhook.
  """
  @spec create(Keyword.t()) :: Operation.t()
  def create(opts) do
    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/webhooks")
  end

  @doc """
  Delete a webhook.
  """
  @spec delete(String.t()) :: Operation.t()
  def delete(id) do
    %Operation{}
    |> Map.put(:method, :delete)
    |> Map.put(:path, "/webhooks/#{id}")
  end

  @doc """
  Retrieve a webhook.
  """
  @spec get(String.t()) :: Operation.t()
  def get(id) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:path, "/webhooks/#{id}")
  end

  @doc """
  Retrieve a list of webhooks.
  """
  @spec list(Keyword.t()) :: Operation.t()
  def list(opts \\ []) do
    %Operation{}
    |> Map.put(:method, :get)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/webhooks")
  end

  @doc """
  Update a webhook.
  """
  @spec update(String.t(), Keyword.t()) :: Operation.t()
  def update(id, opts) do
    %Operation{}
    |> Map.put(:method, :put)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/webhooks/#{id}")
  end
end
