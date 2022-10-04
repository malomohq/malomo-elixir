defmodule Malomo.ReturnTest do
  use ExUnit.Case, async: true

  alias Malomo.Operation
  alias Malomo.Return

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/returns")

    assert expected == Return.create(p1: "v")
  end
end
