defmodule AlchemyConf.MixProject do
  use Mix.Project

  def project do
    [
      app: :alchemy_conf,
      version: "0.3.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Alchemy Conf"
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
      {:colorful, "~> 0.6.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description, do: "The most exquisite Elixir conference in Portugal"

  defp package do
    [
      licenses: ["ISC"],
      links: %{"GitHub" => "https://github.com/subvisual/alchemy_conf"},
      files: ~w(.formatter.exs mix.exs README.md lib LICENSE config.toml)
    ]
  end
end
