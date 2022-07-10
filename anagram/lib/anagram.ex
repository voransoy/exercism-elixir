defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    r = string_to_map(base)

    Enum.reduce(candidates, [], fn x, acc ->
      if r == string_to_map(x) and String.downcase(base) != String.downcase(x),
        do: [x | acc],
        else: acc
    end)
    |> Enum.reverse()
  end

  defp string_to_map(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.reduce(Map.new(), fn x, acc ->
      Map.put(acc, x, (acc[x] || 0) + 1)
    end)
  end
end
