# Malomo v2 API client for Elixir

## Installation

`malomo` is published on Hex. Add it to your list of dependencies in `mix.exs`:

```elixir
defp deps do
  { :malomo, "2.0.0-rc.2" }
end
```

`malomo` require you to provide an HTTP client and JSON codec. `hackney` and
`jason` are used by default. If you wish to use these defaults you will also
need to specify `hackney` and `jason` as dependencies.

## Usage

Each resource module (e.g. `Malomo.Order`) provides functions for building a
request that can be sent to the Malomo v2 API using the `Malomo.request/2`
function.

### Example

```elixir
Malomo.Account.get() |> Malomo.request(access_token: "...")
```

For details on individual resource types [please see our document on HexDocs](https://hexdocs.pm/malomo/2.0.0-rc.0/api-reference.html).

## Configuration

All configuration must be provided on a per-request basis as a keyword list to
the second argument of `Malomo.request/2`.

Possible configuration values are provided below:

* `:access_token` - an OAuth access token, secret key or publishable key used
  by Malomo to authenticate your requests
* `:http_client` - client used when making HTTP requests. Defaults to
  `Malomo.Http.Hackney`.
* `:http_clients_opts` - options or configuration passed to the HTTP client when
  a request is made. Defaults to `[]`.
* `:http_host` - host used to send requests to. Defaults to `api.gomalomo.com`.
* `:http_headers` - additional HTTP headers to send as part of the request.
  Defaults to `[]`.
* `:http_port` - HTTP port used when sending a request
* `:http_protocol` - HTTP protocol used when sending a request. Defaults to
  `https`.
* `:json_codec` - JSON codec used to encode/decode request and response bodies.
  Defaults to `Jason`.
* `:retry` - module implementing a strategy for retrying a request.
  Disable when set to `false`. Defaults to `false`.
* `:retry_opts` - options sent to the retry strategy. Defaults to `[]`,
    * `:max_attempts` - the number of attempts before failing a request.
      Defaults to `3`.

## Retries

`malomo` has a built-in mechanism for retrying requests that either return an
HTTP status code of 500 or a client error. You can enabled retries by providing
a module that implements the `Malomo.Retry` behaviour to the `:retry` option
when calling `Malomo.request/2`.

Currently, `malomo` provides a `Malomo.Retry.Linear` strategy for retrying
requests. This strategy will automatically retry a request on a set interval.
You can configure the interval by adding `:retry_in` with the number
of milliseconds to wait before sending another request to the `:retry_opts`
option.

**Example**

```elixir
Malomo.Account.get() |> Malomo.request(retry: Malomo.Retry.Linear, retry_opts: [retry_in: 250])
```

The example above would retry a failed request after 250 milliseconds. By
default `Malomo.Retry.Linear` will retry a request immediately if `:retry_in`
has no value
