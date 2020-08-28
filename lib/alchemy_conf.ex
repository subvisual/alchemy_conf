defmodule AlchemyConf do
  @config File.read!("config.toml") |> Toml.decode!(keys: :atoms)

  def description do
    get_in(@config, [:meta, :description])
  end

  def date do
    get_in(@config, [:meta, :date])
  end

  def price do
    early_bird_date = get_in(@config, [:tickets, :early_bird, :date])
    early_bird_price = get_in(@config, [:tickets, :early_bird, :price])
    url = get_in(@config, [:tickets, :url])

    """
    Early birds (until #{early_bird_date}): #{early_bird_price}

    Get them at: #{url}
    """
  end
end
