defmodule Malomo.Operation do
  @type t :: %__MODULE__{
               method: Malomo.http_method_t(),
               params: Keyword.t(),
               path: String.t()
             }

  defstruct [method: nil, params: [], path: nil]
end
