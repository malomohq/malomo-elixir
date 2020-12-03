defmodule Malomo.MixProject do
  use Mix.Project

  def project do
    [
      app: :malomo,
      version: "2.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
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
