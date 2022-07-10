defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: step(input, 0)

  defp step(1, count), do: count
  defp step(number, count) when rem(number, 2) == 0, do: step(floor(number / 2), count + 1)
  defp step(number, count), do: step(3 * number + 1, count + 1)
end
