defmodule Malomo.Tracker do
  @moduledoc false

  @doc """
  Create a tracker.
  """
  @spec create(binary, map) :: Malomo.Operation.t()
  def create(order_id, params) do
    %Malomo.Operation{
      action: :post,
      params: params,
      path: "/orders/#{order_id}/trackers"
    }
  end

  @doc """
  Retrieve a single tracker.
  """
  @spec find(binary) :: Malomo.Operation.t()
  def find(id) do
    %Malomo.Operation{
      action: :get,
      path: "/trackers/#{id}"
    }
  end

  @doc """
  Retrieve a list of trackers.
  """
  @spec list(map) :: Malomo.Operation.t()
  def list(params \\ %{}) do
    %Malomo.Operation{
      action: :get,
      params: params,
      path: "/trackers"
    }
  end
end
