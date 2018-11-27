defmodule Malomo.HTTP do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type headers_t :: [{binary, binary}]

  @type method_t :: :delete | :get | :post | :put

  @type response_t :: %{
                         body: binary,
                         headers: headers_t,
                         status_code: pos_integer
                       }

  @callback request(
              method :: method_t,
              url :: binary,
              headers :: headers_t,
              body :: binary,
              opts :: any
            ) :: { :ok, response :: response_t } | { :error, reason :: any }
end
