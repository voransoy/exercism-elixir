defmodule House do
  @rhyme {
    {"lay in", "the house that Jack built.\n"},
    {"ate", "the malt"},
    {"killed", "the rat"},
    {"worried", "the cat"},
    {"tossed", "the dog"},
    {"milked", "the cow with the crumpled horn"},
    {"kissed", "the maiden all forlorn"},
    {"married", "the man all tattered and torn"},
    {"woke", "the priest all shaven and shorn"},
    {"kept", "the rooster that crowed in the morn"},
    {"belonged to", "the farmer sowing his corn"},
    {"", "the horse and the hound and the horn"}
  }
  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, start), do: first(start)
  def recite(start, stop), do: first(start) <> recite(start + 1, stop)

  defp first(1), do: "This is #{elem(elem(@rhyme, 0), 1)}"
  defp first(i), do: "This is #{elem(elem(@rhyme, i - 1), 1)}#{line(i - 1)}"

  defp line(1), do: " that #{elem(elem(@rhyme, 0), 0)} #{elem(elem(@rhyme, 0), 1)}"

  defp line(i),
    do: " that #{elem(elem(@rhyme, i - 1), 0)} #{elem(elem(@rhyme, i - 1), 1)}#{line(i - 1)}"
end
