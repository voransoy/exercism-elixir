defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    case String.length(s) >= size and size > 0 do
      false -> []
      true ->
        Enum.reduce(0..String.length(s)-size, [], fn(i, acc) ->
          [ String.slice(s, i, size) | acc ]
        end)
        |> Enum.reverse()
    end
  end
end
