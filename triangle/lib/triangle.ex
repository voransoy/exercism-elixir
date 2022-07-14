defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    max = Enum.max([a,b,c])
    [o1, o2] = [a,b,c] -- [max]
    cond do
      Enum.min([a,b,c]) <= 0 -> {:error, "all side lengths must be positive"}
      (o1 + o2) < max -> {:error, "side lengths violate triangle inequality"}
      a==b and b==c -> {:ok, :equilateral}
      a==b or b==c or c==a -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end
end
