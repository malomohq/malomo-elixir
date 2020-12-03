defmodule Malomo.OrderTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Order, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/orders")

    assert expected == Order.create(p1: "v")
  end

  test "delete/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/orders/id")

    assert expected == Order.delete("id")
  end

  test "get/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/orders/id")

    assert expected == Order.get("id")
  end

  test "get_events/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/orders/id/events")

    assert expected == Order.get_events("id", p1: "v")
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/orders")

    assert expected == Order.list(p1: "v")
  end

  test "update/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/orders/id")

    assert expected == Order.update("id", p1: "v")
  end
end
