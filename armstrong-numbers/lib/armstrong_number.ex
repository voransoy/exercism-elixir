defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = integer_to_digits(number)
    number == Enum.reduce(digits, 0, fn(x, acc) ->
      acc + x**length(digits)
    end)

  end

  defp integer_to_digits(int), do: integer_to_digits(int, [])
  defp integer_to_digits(int, result) when int < 10, do: [int | result]
  defp integer_to_digits(int, result) do
    integer_to_digits( floor(int/10), [ rem(int, 10) | result ] )
  end
end
