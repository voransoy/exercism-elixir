defmodule RomanNumerals do
  @roman_numerals %{
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I"
  }

  @subs [
    {"CM", ~r/DCCCC/},
    {"XC", ~r/LXXXX/},
    {"IX", ~r/VIIII/},
    {"CD", ~r/CCCC/},
    {"XL", ~r/XXXX/},
    {"IV", ~r/IIII/}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    {result, _} =
      Enum.reduce(Enum.reverse(@roman_numerals), {[], number}, fn {divisor, roman},
                                                                  {acc, remainder} ->
        if remainder >= divisor,
          do: {List.duplicate(roman, floor(remainder / divisor)) ++ acc, rem(remainder, divisor)},
          else: {acc, remainder}
      end)

    string =
      Enum.reverse(result)
      |> Enum.join()

    Enum.reduce(@subs, string, fn {replace, regex}, acc ->
      String.replace(acc, regex, replace)
    end)
  end
end
