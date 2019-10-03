defmodule Malomo.Tracker do
  @moduledoc false

  @doc """
  Create a tracker.
  """
  @spec create(String.t(), map) :: Malomo.Operation.t()
  def create(order_id, params) do
    %Malomo.Operation{
      method: :post,
      params: params,
      path: "/orders/#{order_id}/trackers"
    }
  end

  @doc """
  Retrieve a single tracker.
  """
  @spec find(String.t()) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      method: :get,
      path: "/trackers/#{id}"
    }
  end

  @doc """
  Retrieve a list of trackers.
  """
  @spec list(map) :: Malomo.Operation.t()
  def list(params \\ %{}) do
    %Malomo.Operation{
      method: :get,
      params: params,
      path: "/trackers"
    }
  end
end
