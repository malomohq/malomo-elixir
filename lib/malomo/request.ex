defmodule Malomo.Request do
  @moduledoc """
  Represents an HTTP request.
  """

  @type %__MODULE__{
          body: binary,
          headers: [{binary, binary}],
          method: atom,
          url: binary
        }

  defstruct body: "", headers: [], method: nil, url: nil
end
