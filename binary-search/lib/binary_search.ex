defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found

  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers)-1)
  end

  def search(numbers, key, start, finish) do
    middle = ceil((finish + start)/2)
    cond  do
      elem(numbers, middle) == key -> {:ok, middle}
      start == finish -> :not_found
      true ->
        if elem(numbers, middle) < key,
          do: search(numbers, key, middle+1, finish),
          else: search(numbers, key, start, middle-1)
    end
  end
end
