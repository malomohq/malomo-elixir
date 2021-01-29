defmodule Malomo.Operation do
  @type encoding_t ::
          :json | :www_form_urlencoded

  @type t ::
          %__MODULE__{
            encoding: encoding_t,
            method: Malomo.http_method_t(),
            params: Keyword.t(),
            path: String.t()
          }

  defstruct [encoding: :json, method: nil, params: [], path: nil]
end
