defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    flatten_reducer(list, [])
    |> Enum.reverse()
  end

  defp flatten_reducer(e, acc) when is_list(e), do: Enum.reduce(e, acc, &flatten_reducer(&1, &2))

  defp flatten_reducer(e, acc) when is_nil(e), do: acc

  defp flatten_reducer(e, acc), do: [e | acc]
end
