defmodule Malomo.ReturnTest do
  use ExUnit.Case, async: true

  alias Malomo.Operation
  alias Malomo.Return

  test "create/1" do
    expected = %Operation{
      method: :post,
      params: [p1: "v"],
      path: "/returns"
    }

    assert expected == Return.create(p1: "v")
  end

  test "get/1" do
    expected = %Operation{
      method: :get,
      params: [],
      path: "/returns/0d639a29-feeb-338f-bc82-e578602e4a02"

    }

    assert expected == Return.get("0d639a29-feeb-338f-bc82-e578602e4a02")
  end

  test "get_by_alternate_id/1" do
    expected = %Operation{
      method: :get,
      params: [alternate_id: "0d639a29-feeb-338f-bc82-e578602e4a02"],
      path: "/returns"

    }

    assert expected == Return.get_by_alternate_id("0d639a29-feeb-338f-bc82-e578602e4a02")
  end

  test "update/2" do
    expected = %Operation{
      method: :put,
      params: [p1: "v"],
      path: "/returns/0d639a29-feeb-338f-bc82-e578602e4a02"

    }

    assert expected == Return.update("0d639a29-feeb-338f-bc82-e578602e4a02", p1: "v")
  end
end
