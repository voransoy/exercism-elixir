defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}

  def convert(digits, input_base, output_base) do
    cond do
      output_base < 2 ->
        {:error, "output base must be >= 2"}

      input_base < 2 ->
        {:error, "input base must be >= 2"}

      length(digits) > 0 and (Enum.max(digits) >= input_base or Enum.min(digits) < 0) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        {:ok,
         to_base10(digits, input_base, length(digits) - 1)
         |> to_output_base(output_base)
         |> Enum.reverse()}
    end
  end

  @doc false
  defp to_base10([], _base, _count), do: 0

  defp to_base10([h | t], base, count),
    do: h * base ** count + to_base10(t, base, count - 1)

  @doc false
  defp to_output_base(number, base) when base > number, do: [number]

  defp to_output_base(number, base) do
    remainder = rem(number, base)
    dividend = ((number - remainder) / base) |> trunc()
    [rem(number, base) | to_output_base(dividend, base)]
  end
end
