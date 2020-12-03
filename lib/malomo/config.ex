defmodule Malomo.Config do
  @type t ::
          %__MODULE__{
            access_token: String.t(),
            http_client: module,
            http_client_opts: any,
            http_headers: Malomo.http_headers_t(),
            http_host: String.t(),
            http_port: pos_integer,
            http_protocol: String.t(),
            json_codec: module,
            retry: boolean |  module,
            retry_opts: Keyword.t()
          }

  defstruct access_token: nil,
            http_client: Malomo.Http.Hackney,
            http_client_opts: [],
            http_headers: [],
            http_host: "api.gomalomo.com",
            http_port: nil,
            http_protocol: "https",
            json_codec: Jason,
            retry: false,
            retry_opts: []

  @spec new(Keyword.t()) :: t
  def new(overrides) do
    Map.merge(%__MODULE__{}, Enum.into(overrides, %{}))
  end
end
