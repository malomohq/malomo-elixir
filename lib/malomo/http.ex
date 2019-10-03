defmodule Malomo.HTTP do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type response_t ::
          %{
            body: String.t(),
            headers: Malomo.http_headers_t(),
            status_code: pos_integer
          }

  @callback request(
              method :: Malomo.http_method_t(),
              url :: String.t(),
              headers :: Malomo.http_headers_t(),
              body :: String.t(),
              opts :: any
            ) :: { :ok, response :: response_t } | { :error, reason :: any }
end
