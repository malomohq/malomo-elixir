defmodule Malomo.MixProject do
  use Mix.Project

  def project do
    [
      app: :malomo,
      version: "0.0.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:hackney]]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      { :hackney,  "~> 1.14",   optional: true },
      { :jason,    "~> 1.1",    optional: true },
      { :dialyxir, "~> 1.0-rc", only: [:dev, :test] },
      { :ex_doc,   "~> 0.19",   only: :dev }
    ]
  end
end
