defmodule Malomo.Webhook do
  @doc """
  Create a webhook.
  """
  @spec create(map) :: Malomo.Operation.t()
  def create(params) do
    %Malomo.Operation{
      method: :post,
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
      method: :delete,
      path: "/webhooks/#{id}"
    }
  end

  @doc """
  Retrieve a single webhook.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      method: :get,
      path: "/webhooks/#{id}"
    }
  end

  @doc """
  Update a webhook.
  """
  @spec update(binary, map) :: Malomo.Operation.t()
  def update(id, params) do
    %Malomo.Operation{
      method: :put,
      params: params,
      path: "/webhooks/#{id}"
    }
  end

  @doc """
  Verify the signature of an incoming webhook event.
  """
  @spec verify_signature(binary, binary, binary) :: :ok | :error
  def verify_signature(signature, secret, body) do
    computed_signature = Base.encode16(:crypto.hmac(:sha256, secret, body))

    cond do
      signature == computed_signature ->
        :ok
      true ->
        :error
    end
  end
end
