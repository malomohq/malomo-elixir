defmodule Malomo.Config do
  @type t :: %__MODULE__{
               host: binary,
               http_client: module,
               http_client_opts: any,
               json_codec: module,
               port: pos_integer | nil,
               private_api_key: binary,
               public_api_key: binary,
               scheme: binary
             }

  defstruct host: nil,
            http_client: Malomo.HTTP.Hackney,
            http_client_opts: [],
            json_codec: Jason,
            port: nil,
            private_api_key: nil,
            public_api_key: nil,
            scheme: nil

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
