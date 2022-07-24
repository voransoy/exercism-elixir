defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""
  def recite([string]), do: "And all for the want of a #{string}.\n"

  def recite(strings) do
    strings
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map_join("\n", fn [a, b] -> "For want of a #{a} the #{b} was lost." end)
    |> Kernel.<>("\nAnd all for the want of a #{hd(strings)}.\n")
  end
end
