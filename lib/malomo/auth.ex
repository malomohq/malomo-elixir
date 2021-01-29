defmodule Malomo.Auth do
  alias Malomo.{ Operation }

  @doc """
  Create an access code.
  """
  @spec create_access_token(Keyword.t()) :: Operation.t()
  def create_access_token(opts) do
    opts = Keyword.put(opts, :grant_type, "authorization_code")

    %Operation{}
    |> Map.put(:method, :post)
    |> Map.put(:params, opts)
    |> Map.put(:path, "/oauth2/token")
  end
end
