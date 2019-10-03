defmodule Malomo do
  alias Malomo.{ Config, Operation, Request, Response }

  @type http_headers_t :: [{ String.t(), String.t() }]

  @type http_method_t :: :delete | :get | :post | :put

  @type response_t :: { :ok, Response.t() } | { :error, any }

  @doc """
  Make a request to the Malomo API
  """
  @spec request(Operation.t(), map) :: response_t
  def request(operation, config \\ %{}) do
    config = Config.new(config)

    Request.send(operation, config)
  end
end
