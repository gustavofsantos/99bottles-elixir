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

  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  @spec verse(integer()) :: String.t()
  def verse(number) do
    """
    #{number} #{container(number)} of beer on the wall, #{number} #{container(number)} of beer.
    Take one down and pass it around, #{number - 1} #{container(number - 1)} of beer on the wall.
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

  defp container(number) do
    case number do
      1 -> "bottle"
      _ -> "bottles"
    end
  end
end
