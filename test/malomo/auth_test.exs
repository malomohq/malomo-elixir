defmodule Malomo.AuthTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Auth, Operation }

  test "create_access_token/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [grant_type: "authorization_code", p1: "v"])
    expected = Map.put(expected, :path, "/oauth2/token")

    assert expected == Auth.create_access_token(p1: "v")
  end
end
