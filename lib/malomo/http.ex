defmodule Malomo.HTTP do
  @moduledoc """
  Behaviour for implementing an HTTP client.
  """

  @type response_t ::
          %{
            body: binary,
            headers: Malomo.http_headers_t(),
            status_code: pos_integer
          }

  @callback request(
              method :: Malomo.http_method_t(),
              url :: binary,
              headers :: Malomo.http_headers_t(),
              body :: binary,
              opts :: any
            ) :: { :ok, response :: response_t } | { :error, reason :: any }
end
