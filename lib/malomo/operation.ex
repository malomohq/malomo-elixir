defmodule Malomo.Operation do
  @type action_t :: :delete | :get | :post | :put

  @type t :: %__MODULE__{ action: action_t, params: map, path: binary }

  defstruct [:action, :params, :path]
end
