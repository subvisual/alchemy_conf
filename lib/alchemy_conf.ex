defmodule AlchemyConf do
  @config File.read!("config.toml") |> Toml.decode!(keys: :atoms)

  def description do
    get_in(@config, [:meta, :description])
  end

  def date do
    get_in(@config, [:meta, :date])
  end

  def tickets do
    @config[:tickets]
  end
end
