defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when number < 1,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    factors(number)
    |> Enum.sum()
    |> check(number)
  end

  def factors(n) do
    1..ceil(n / 2)
    |> Enum.filter(fn f -> rem(n, f) == 0 and f != n end)
  end

  def check(r, n) when r == n, do: {:ok, :perfect}
  def check(r, n) when r > n, do: {:ok, :abundant}
  def check(r, n) when r < n, do: {:ok, :deficient}
end
