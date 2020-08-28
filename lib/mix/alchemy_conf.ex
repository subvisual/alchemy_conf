defmodule Mix.AlchemyConf do
  @moduledoc """
  Utils for Alchemy Conf mix tasks.
  """

  @char_deviation 3

  # Based off https://github.com/ReSTARTR/ex-lolcat
  def rainbow(str) do
    seed = :rand.uniform(256)

    str
    |> String.split("")
    |> Enum.with_index()
    |> Enum.map(fn {char, idx} -> colorize(char, idx, seed) end)
    |> Enum.join()
  end

  defp colorize(char, idx, seed) do
    if Regex.match?(~r/^\s$/, char) do
      char
    else
      rgb = rgb(seed + idx / 8)
      Colorful.string(char, rgb)
    end
  end

  defp rgb(i) do
    r = (:math.sin(@char_deviation * i + 0 * :math.pi() / 3) * 127 + 128) |> to_ansi()
    g = (:math.sin(@char_deviation * i + 2 * :math.pi() / 3) * 127 + 128) |> to_ansi()
    b = (:math.sin(@char_deviation * i + 4 * :math.pi() / 3) * 127 + 128) |> to_ansi()

    {r, g, b}
  end

  defp to_ansi(v) do
    (6 * (v / 256)) |> Kernel.trunc()
  end
end
