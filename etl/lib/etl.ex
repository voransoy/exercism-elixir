defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, Map.new, fn({x,y}, a1) ->
      Enum.reduce(y, Map.new, fn(letter, a2) ->
        Map.put(a2, String.downcase(letter), x)
      end)
      |> Map.merge(a1)
    end)
  end
end
