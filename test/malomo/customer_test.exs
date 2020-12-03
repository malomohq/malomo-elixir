defmodule Malomo.CustomerTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Customer, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/customers")

    assert expected == Customer.create(p1: "v")
  end

  test "delete/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/customers/id")

    assert expected == Customer.delete("id")
  end

  test "get/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/customers/id")

    assert expected == Customer.get("id")
  end

  test "get_events/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/customers/id/events")

    assert expected == Customer.get_events("id", p1: "v")
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/customers")

    assert expected == Customer.list(p1: "v")
  end

  test "update/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/customers/id")

    assert expected == Customer.update("id", p1: "v")
  end
end
