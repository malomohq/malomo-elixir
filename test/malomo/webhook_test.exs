defmodule Malomo.WebhookTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Webhook, Operation }

  test "create/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :post)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/webhooks")

    assert expected == Webhook.create(p1: "v")
  end

  test "delete/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :delete)
    expected = Map.put(expected, :path, "/webhooks/id")

    assert expected == Webhook.delete("id")
  end

  test "get/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :path, "/webhooks/id")

    assert expected == Webhook.get("id")
  end

  test "list/1" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :get)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/webhooks")

    assert expected == Webhook.list(p1: "v")
  end

  test "update/2" do
    expected = %Operation{}
    expected = Map.put(expected, :method, :put)
    expected = Map.put(expected, :params, [p1: "v"])
    expected = Map.put(expected, :path, "/webhooks/id")

    assert expected == Webhook.update("id", p1: "v")
  end
end
