defmodule AlchemyConf.MixProject do
  use Mix.Project

  def project do
    [
      app: :alchemy_conf,
      version: "0.1.0",
      elixir: "~> 1.10",
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
    [
      {:toml, "~> 0.6.1"},
      {:colorful, "~> 0.6.0"}
    ]
  end
end
