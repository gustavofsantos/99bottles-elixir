defmodule Bottles do
  @moduledoc """
  Documentation for `Bottles`.
  """

  @spec verse(integer()) :: String.t()
  def verse(number) do
    """
    #{String.capitalize(quantity(number))} #{container(number)} of beer on the wall, #{quantity(number)} #{container(number)} of beer.
    #{action(number)}, #{quantity(successor(number))} #{container(number - 1)} of beer on the wall.
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

  @spec container(integer()) :: String.t()
  defp container(number) do
    case number do
      1 -> "bottle"
      _ -> "bottles"
    end
  end

  @spec pronoum(integer()) :: String.t()
  defp pronoum(number) do
    case number do
      1 -> "it"
      _ -> "one"
    end
  end

  @spec quantity(integer()) :: String.t()
  defp quantity(number) do
    case number do
      0 -> "no more"
      _ -> to_string(number)
    end
  end

  defp action(0), do: "Go to the store and buy some more"
  defp action(number), do: "Take #{pronoum(number)} down and pass it around"

  defp successor(0), do: 99
  defp successor(number), do: number - 1
end
