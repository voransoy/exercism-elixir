defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @vowels ["a", "e", "i", "o", "u"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.split(phrase)
    |> Enum.map(&translator/1)
    |> Enum.join(" ")
  end

  defp translator(<<"qu", rest::binary>>), do: rest <> "quay"

  defp translator(<<x::binary-size(1), y::binary-size(1), _rest::binary>> = phrase)
       when y not in @vowels and x in ["x", "y"],
       do: phrase <> "ay"

  defp translator(<<x::binary-size(2), _::binary>> = phrase) when x in ["xr", "yt"],
    do: phrase <> "ay"

  defp translator(<<x::binary-size(3), rest::binary>>) when x in ["thr", "sch", "str", "squ"],
    do: rest <> x <> "ay"

  defp translator(<<x::binary-size(2), rest::binary>>) when x in ["ch", "rh", "th", "qu", "pl"],
    do: rest <> x <> "ay"

  defp translator(<<x::binary-size(1), rest::binary>>) when x not in @vowels,
    do: rest <> x <> "ay"

  defp translator(<<x::binary-size(1), _::binary>> = phrase) when x in @vowels,
    do: phrase <> "ay"

  defp translator(phrase) do
    g = Regex.named_captures(~r/^(?<consonants>[^aeiou]+)(?<rest>\w+)/, phrase)
    g["rest"] <> g["consonants"] <> "ay"
  end
end
