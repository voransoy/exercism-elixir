defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> group()
    |> Enum.reverse()
    |> Enum.reduce("", fn x, acc ->
      count = if length(x) == 1, do: "", else: "#{length(x)}"
      "#{acc}#{count}#{hd(x)}"
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(~r/(\d+)([[:alpha:]]|[[:space:]])/, string, fn _, count, letter ->
      String.duplicate(letter, String.to_integer(count))
    end)
  end

  def group(list), do: group(list, [])
  def group([], acc), do: acc
  def group(list, []), do: group(tl(list), [[hd(list)]])

  def group(list, acc) do
    [ref | _] = hd(acc)
    letter = hd(list)

    case ref == letter do
      true -> group(tl(list), [[letter | hd(acc)] | tl(acc)])
      false -> group(tl(list), [[letter] | acc])
    end
  end
end
