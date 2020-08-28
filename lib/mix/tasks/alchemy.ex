defmodule Mix.Tasks.Alchemy do
  use Mix.Task

  def run(_) do
    message() |> Mix.shell().info()
  end

  defp message do
    [
      border(),
      line(),
      title(),
      description(),
      line(),
      line(),
      date(),
      line(),
      line(),
      price(),
      tickets_url(),
      line(),
      border()
    ]
    |> Enum.join("\n")
  end

  defp title do
    "Alchemy Conf"
    |> center()
  end

  defp description do
    AlchemyConf.description()
    |> center()
  end

  defp date do
    AlchemyConf.date()
    |> center()
  end

  defp price do
    %{
      early_bird: %{
        price: price,
        date: date
      }
    } = AlchemyConf.tickets()

    "Early birds (until #{date}): #{price}" |> center()
  end

  defp tickets_url do
    %{url: url} = AlchemyConf.tickets()

    "Get them at: #{url}" |> center()
  end

  defp border do
    String.duplicate("#", 80)
  end

  defp line do
    spaces = String.duplicate(" ", 78)
    "##{spaces}#"
  end

  defp center(str) do
    nr_spaces = 80 - String.length(str) - 2
    nr_spaces_left = floor(nr_spaces / 2)
    nr_spaces_right = nr_spaces - nr_spaces_left

    spaces_left = String.duplicate(" ", nr_spaces_left)
    spaces_right = String.duplicate(" ", nr_spaces_right)

    "##{spaces_left}#{str}#{spaces_right}#"
  end
end
