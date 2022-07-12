defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      subset?(a, b) -> :superlist
      subset?(b, a) -> :sublist
      true -> :unequal
    end
  end

  def subset?(a, b) when length(a) < length(b), do: false
  def subset?(a, b) when a === b, do: true
  def subset?(a, b), do: if(Enum.slice(a, 0, length(b)) === b, do: true, else: subset?(tl(a), b))
end
