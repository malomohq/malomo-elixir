defmodule Malomo.HTTP do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type response_t :: %{
                         body: binary,
                         headers: [{binary, binary}],
                         status_code: pos_integer
                       }

  @callback request(
              method :: binary,
              url :: binary,
              headers :: [{binary, binary}],
              body :: binary,
              opts :: any
            ) :: { :ok, response :: response_t } | { :error, reason :: any }
end
