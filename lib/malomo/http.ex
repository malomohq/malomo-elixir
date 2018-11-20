defmodule Malomo.HTTP do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type response_t :: %{
                         body: binary,
                         headers: [{binary, binary}],
                         status_code: pos_integer
                       }

  @callback request(Malomo.Request.t(), opts :: term) ::
              {:ok, response_t} | {:error, reason :: any}
end
