defmodule Malomo.App do
  alias Malomo.Operation

  @doc """
  Uninstall the app associated with the access token provided in the request
  headers
  """
  @spec uninstall :: Operation.t()
  def uninstall do
    %Operation{method: :delete, path: "/app"}
  end
end
