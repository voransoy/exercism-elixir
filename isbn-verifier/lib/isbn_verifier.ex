defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    if validate(isbn) do
      String.replace(isbn, "-", "")
      |> String.graphemes()
      |> Enum.map(&to_digit/1)
      |> Enum.reduce({10, 0}, fn i, {p, acc} ->
        {p - 1, acc + i * p}
      end)
      |> elem(1)
      |> rem(11)
      |> Kernel.==(0)
    else
      false
    end
  end

  defp to_digit("X"), do: 10
  defp to_digit(i), do: String.to_integer(i)

  defp validate(isbn) do
    Regex.match?(~r/^\d{9}(\d{1}|X)$/, String.replace(isbn, "-", ""))
  end
end
