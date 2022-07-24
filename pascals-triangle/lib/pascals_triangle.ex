defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    Enum.map(1..num, &row/1)
  end

  def row(1), do: [1]
  def row(2), do: [1, 1]

  def row(n) do
    r = row(n - 1)
    |> Enum.chunk_every(2, 1, [0])
    |> Enum.map(&Enum.sum/1)
    [1 | r]
  end
end
