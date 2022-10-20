defmodule Malomo.AppTest do
  use ExUnit.Case, async: true

  alias Malomo.App

  describe "uninstall/1" do
    test "returns the operation" do
      expected = %Malomo.Operation{
        method: :delete,
        path: "/app"
      }

      assert expected == App.uninstall()
    end
  end
end
