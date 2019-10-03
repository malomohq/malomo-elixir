defmodule Malomo.Response do
  alias Malomo.{ Config, Helpers, HTTP }

  @type t :: %__MODULE__{
               body: map,
               headers: [{binary, binary}],
               private: map,
               status_code: pos_integer
             }

  defstruct body: %{}, headers: [], private: %{}, status_code: nil

  @spec new(HTTP.response_t(), Config.t(), map) :: t
  def new(response, private, config) do
    %__MODULE__{
      body: Helpers.JSON.decode(response.body, config),
      headers: response.headers,
      private: private,
      status_code: response.status_code
    }
  end
end
