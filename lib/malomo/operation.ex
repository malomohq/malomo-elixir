defmodule Malomo.Operation do
  @type t :: %__MODULE__{
               method: Malomo.http_method_t(),
               params: map,
               path: binary
             }

  defstruct [method: nil, params: %{}, path: nil]
end
