defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @points [
    { ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1},
    { ["D", "G"], 2},
    { ["B", "C", "M", "P"], 3},
    { ["F", "H", "V", "W", "Y"], 4},
    { ["K"], 5},
    { ["J", "X"], 8},
    { ["Q", "Z"], 10},
  ]

  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    String.upcase(word)
    |> String.graphemes()
    |> Enum.map( &letter_score/1 )
    |> Enum.sum()
  end

  defp letter_score(letter) do
    case Enum.find(@points, fn({list , _point})-> letter in list end) do
      nil -> 0
      {_, point} -> point
    end
  end
end
