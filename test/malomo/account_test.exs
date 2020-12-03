defmodule Malomo.AccountTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Account, Operation }

  test "get/0" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/accounts/self")

    assert expected == Account.get()
  end
end
