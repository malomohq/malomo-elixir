defmodule Malomo.Response do
  @moduledoc """
  Represents an HTTP response.
  """

  @type t :: %__MODULE__{
               body: map,
               headers: [{binary, binary}],
               status_code: pos_integer
             }

  defstruct body: %{}, headers: [], status_code: nil
end
