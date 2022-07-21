defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    list =
      String.downcase(sentence)
      |> String.replace(~r/[^a-z]/, "")
      |> String.graphemes()

    [] == list -- MapSet.to_list(MapSet.new(list))
  end
end
