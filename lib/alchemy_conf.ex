defmodule AlchemyConf do
  def description do
    "The most exquisite Elixir conference in Portugal"
  end

  def date do
    "14 & 15 May 2021"
  end

  def location do
    %{
      city: "Braga, Portugal"
    }
  end

  def tickets do
    %{
      early_bird: %{
        date: "01-01-2021",
        price: "160.80€"
      },
      url: "https://ti.to/subvisual/alchemy-conf-2021"
    }
  end
end
