defmodule MatchingBrackets do
  @pairs %{
    "{" => "}",
    "[" => "]",
    "(" => ")"
  }
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    String.graphemes(str)
    |> reduce()
  end

  defp reduce(list, acc \\ [])
  defp reduce([], acc), do: acc == []
  defp reduce([h | t], acc) when h in ~w/( { [/, do: reduce(t, [h | acc])
  defp reduce([h | _t], []) when h in ~w/) } ]/, do: false

  defp reduce([h | t], acc) when h in ~w/) } ]/,
    do: if(h == Map.get(@pairs, hd(acc)), do: reduce(t, tl(acc)), else: false)

  defp reduce([_h | t], acc), do: reduce(t, acc)
end
