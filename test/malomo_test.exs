defmodule MalomoTest do
  use ExUnit.Case, async: true

  alias Malomo.{ Http, Operation, Response }

  @ok_resp %{ body: "{\"ok\":true}", headers: [], status_code: 200 }

  @not_ok_resp %{ body: "{\"ok\":false}", headers: [], status_code: 400 }

  test "sends the proper HTTP method" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :get, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert :get == Http.Mock.get_request_method()
  end

  test "uses the proper URL for GET requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :get, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "https://api.gomalomo.com/fake?hello=world" == Http.Mock.get_request_url()
  end

  test "uses the proper URL for DELETE requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :delete, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "https://api.gomalomo.com/fake?hello=world" == Http.Mock.get_request_url()
  end

  test "uses the proper URL for non-GET requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "https://api.gomalomo.com/fake" == Http.Mock.get_request_url()
  end

  test "sends the proper HTTP headers" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{}
    operation = Map.put(operation, :method, :get)
    operation = Map.put(operation, :params, [hello: "world"])
    operation = Map.put(operation, :path, "/fake")

    Malomo.request(operation, access_token: "thisisfake", http_client: Http.Mock, http_headers: [{ "x-custom-header", "true" }])

    assert { "accept", "application/vnd.malomo+json; version=2" } in Http.Mock.get_request_headers()
    assert { "content-type", "application/json" } in Http.Mock.get_request_headers()
    assert { "authorization", "Bearer thisisfake" } in Http.Mock.get_request_headers()
    assert { "x-custom-header", "true" } in Http.Mock.get_request_headers()
  end

  test "sends the proper \"content-type\" header when encoding is :www_form_urlencoded" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{}
    operation = Map.put(operation, :encoding, :www_form_urlencoded)
    operation = Map.put(operation, :method, :get)
    operation = Map.put(operation, :params, [hello: "world"])
    operation = Map.put(operation, :path, "/fake")

    Malomo.request(operation, http_client: Http.Mock)

    assert { "content-type", "application/x-www-form-urlencoded" } in Http.Mock.get_request_headers()
  end

  test "sends the proper body for GET requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :get, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "" == Http.Mock.get_request_body()
  end

  test "sends the proper body for DELETE requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :delete, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "" == Http.Mock.get_request_body()
  end

  test "sends the proper body for non-GET requests" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "{\"hello\":\"world\"}" == Http.Mock.get_request_body()
  end

  test "sends the proper body when encoding is :www_form_urlencoded" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ encoding: :www_form_urlencoded, method: :post, params: [hello: "world"], path: "/fake" }

    Malomo.request(operation, http_client: Http.Mock)

    assert "hello=world" == Http.Mock.get_request_body()
  end

  test "parses the body properly when no body is returned" do
    Http.Mock.start_link()

    response = { :ok, %{ body: "", headers: [], status_code: 204 } }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :delete, path: "/fake" }

    { :ok, %_{ body: body } } = Malomo.request(operation, http_client: Http.Mock)

    assert %{} == body
  end

  test "returns :ok when the request is successful" do
    Http.Mock.start_link()

    response = { :ok, @ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    result = Malomo.request(operation, http_client: Http.Mock)

    assert { :ok, %Response{} } = result
  end

  test "returns :error when the request is not successful" do
    Http.Mock.start_link()

    response = { :ok, @not_ok_resp }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    result = Malomo.request(operation, http_client: Http.Mock)

    assert { :error, %Response{} } = result
  end

  test "passes the response through when unrecognized" do
    Http.Mock.start_link()

    response = { :error, :timeout }

    Http.Mock.put_response(response)

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    result = Malomo.request(operation, http_client: Http.Mock)

    assert ^response = result
  end

  test "properly handles retries" do
    Http.Mock.start_link()

    Http.Mock.put_response({ :error, :timeout })
    Http.Mock.put_response({ :ok, @ok_resp })

    operation = %Operation{ method: :post, params: [hello: "world"], path: "/fake" }

    result = Malomo.request(operation, http_client: Http.Mock, retry: Malomo.Retry.Linear)

    assert { :ok, %Response{} } = result
  end
end
