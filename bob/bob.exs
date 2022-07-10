defmodule Bob do
  def hey(input) do
    cond do
      check_silence(input) ->
        "Fine. Be that way!"
      check_shout(input) and check_question(input) and not check_numeric(input)->
        "Calm down, I know what I'm doing!"
      check_question(input) ->
        "Sure."
      check_shout(input) and not check_numeric(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
  defp check_question(input), do: String.ends_with?(input, "?")
  defp check_shout(input), do: String.upcase(input) == input
  defp check_silence(input), do: String.trim(input) == ""
  defp check_numeric(input), do: String.upcase(input) == String.downcase(input)
end
