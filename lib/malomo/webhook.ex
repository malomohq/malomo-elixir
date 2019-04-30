defmodule Malomo.Webhook do
  @doc """
  Create a webhook.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/webhooks"
    }
  end

  @doc """
  Delete a webhook.
  """
  @spec delete(binary) :: Malomo.Operation.t()
  def delete(id) do
    %Malomo.Operation{
      action: :delete,
      path: "/webhooks/#{id}"
    }
  end

  @doc """
  Retrieve a single webhook.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/webhooks/#{id}"
    }
  end

  @doc """
  Update a webhook.
  """
  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      action: :put,
      params: params,
      path: "/webhooks/#{id}"
    }
  end
end
