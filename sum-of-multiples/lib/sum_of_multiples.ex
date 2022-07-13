defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.filter(factors, fn f -> f < limit and f > 0 end)
    |> Enum.map(fn x ->
      Enum.map(1..floor(limit / x), fn y -> y * x end)
    end)
    |> List.flatten()
    |> Enum.filter(&Kernel.!=(&1, limit))
    |> Enum.uniq()
    |> Enum.sum()
  end
end
