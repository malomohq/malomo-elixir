defmodule Malomo.Http do
  alias Malomo.{ Request }

  @type response_t ::
          %{
            body: String.t(),
            headers: Malomo.http_headers_t(),
            status_code: Malomo.http_status_code_t()
          }

  @callback send(
              request :: Request.t(),
              opts :: any
            ) :: { :ok, response_t } | { :error, response_t | any }
end
