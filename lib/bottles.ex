defmodule Bottles do
  @moduledoc """
  Documentation for `Bottles`.
  """

  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(number) when number == 1 do
    """
    #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
    Take #{pronoum(number)} down and pass it around, #{quantity(number - 1)} #{container(number - 1)} of beer on the wall.
    """
  end

  @spec verse(integer()) :: String.t()
  def verse(number) do
    """
    #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
    Take #{pronoum(number)} down and pass it around, #{number - 1} #{container(number - 1)} of beer on the wall.
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

  defp quantity(number) do
    case number do
      0 -> "no more"
      _ -> number
    end
  end
end
