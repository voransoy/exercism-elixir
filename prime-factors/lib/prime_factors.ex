defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number, d \\ 2, l \\ [])
  def factors_for(1, _, l), do: Enum.reverse(l)

  def factors_for(number, d, l) do
    if rem(number, d) == 0,
      do: factors_for(floor(number / d), d, [d | l]),
      else: factors_for(number, d + 1, l)
  end
end
