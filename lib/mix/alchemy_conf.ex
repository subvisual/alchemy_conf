defmodule Mix.AlchemyConf do
  @moduledoc """
  Utils for Alchemy Conf mix tasks.
  """

  @char_deviation 3
  @reset IO.ANSI.reset()

  # Based off @ReSTARTR/ex-lolcat and @Joe-noh/colorful

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

      colorize(char, rgb)
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

  defp rgb_to_ansi({r, g, b}) do
    "\e[38;5;#{16 + r * 36 + 6 * g + b}m"
  end

  defp colorize(str, rgb) do
    @reset <> rgb_to_ansi(rgb) <> str <> @reset
  end
end
