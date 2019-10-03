defmodule Malomo.Config do
  @type t :: %__MODULE__{
               api_key: String.t(),
               headers: Malomo.http_headers_t(),
               host: String.t(),
               http_client: module,
               http_client_opts: any,
               json_codec: module,
               path: String.t(),
               port: pos_integer | nil,
               retry: boolean,
               retry_opts: Keyword.t(),
               scheme: String.t()
             }

  defstruct api_key: nil,
            headers: [],
            host: "api.gomalomo.com",
            http_client: Malomo.HTTP.Hackney,
            http_client_opts: [],
            json_codec: Jason,
            path: "/",
            port: nil,
            retry: false,
            retry_opts: [],
            scheme: "https"

  @doc """
  Build a new config struct.

  The config is composed of values provided through application configuration
  and a map of optional overrides. If overrides are provided they will be merged
  with the application configuration.
  """
  @spec new(map) :: t
  def new(overrides \\ %{}) do
    config =
      Application.get_all_env(:malomo)
      |> Enum.into(%{})
      |> Map.merge(overrides)

    struct(__MODULE__, config)
  end
end
