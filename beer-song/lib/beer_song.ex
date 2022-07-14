defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(number) do
    """
    #{beer_number(number)} of beer on the wall, #{beer_number(number)} of beer.
    Take #{last_beer(number - 1)} down and pass it around, #{beer_number(number - 1)} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)
  end

  defp beer_number(0), do: "no more bottles"
  defp beer_number(1), do: "1 bottle"
  defp beer_number(n), do: "#{n} bottles"

  defp last_beer(0), do: "it"
  defp last_beer(_), do: "one"

end
