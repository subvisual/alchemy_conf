defmodule AlchemyConf do
  @config Path.join([__DIR__, "..", "config.toml"]) |> File.read!() |> Toml.decode!()

  def description do
    get_in(@config, [:meta, :description])
  end

  def date do
    get_in(@config, [:meta, :date])
  end

  def location do
    @config[:location]
  end

  def tickets do
    @config[:tickets]
  end
end
