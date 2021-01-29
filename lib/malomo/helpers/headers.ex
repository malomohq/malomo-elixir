defmodule Malomo.Helpers.Headers do
  @moduledoc false

  def content_type(%_{ encoding: :www_form_urlencoded }) do
    [{ "content-type", "application/x-www-form-urlencoded" }]
  end

  def content_type(_operation) do
    [{ "content-type", "application/json" }]
  end
end
