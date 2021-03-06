defmodule Bottles do
  @moduledoc """
  Documentation for `Bottles`.
  """

  @spec verse(integer()) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(quantity(number))} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
    #{action(number)}, #{quantity(successor(number))} #{container(successor(number))} of beer on the wall.
    """
  end

  @spec song() :: String.t()
  def song do
    verses(99, 0)
  end

  @spec verses(integer(), integer()) :: String.t()
  def verses(n, m) do
    Enum.map(n..m, &verse/1)
    |> Enum.join("\n")
  end

  defp container(1), do: "bottle"
  defp container(_), do: "bottles"

  defp pronoum(1), do: "it"
  defp pronoum(_), do: "one"

  defp quantity(0), do: "no more"
  defp quantity(number), do: to_string(number)

  defp action(0), do: "Go to the store and buy some more"
  defp action(number), do: "Take #{pronoum(number)} down and pass it around"

  defp successor(0), do: 99
  defp successor(number), do: number - 1
end
