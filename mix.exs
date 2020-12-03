defmodule Malomo.MixProject do
  use Mix.Project

  def project do
    [
      app: :malomo,
      version: "2.0.0-rc.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:hackney]],
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      { :hackney, "~> 1.16", optional: true },

      { :jason, "~> 1.2", optional: true },

      #
      # dev
      #

      { :dialyxir, "~> 1.0", only: :dev, runtime: false },

      { :ex_doc, ">= 0.0.0", only: :dev, runtime: false }
    ]
  end

  defp elixirc_paths(:test) do
    ["lib/", "test/"]
  end

  defp elixirc_paths(_env) do
    ["lib/"]
  end

  defp package do
    %{
      description: "Elixir client for the Malomo v2 API",

      maintainers: ["Anthony Smith"],

      licenses: ["MIT"],

      links: %{
        GitHub: "https://github.com/malomohq/malomo-elixir",

        "Made by Malomo - Post-purchase experiences that customers love": "https://gomalomo.com"
      }
    }
  end
end
