defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0, do: nth(count-1, [2])
  def nth(0, list), do: hd(list)
  def nth(count, list), do: nth(count-1, [ next_prime(hd(list)) | list ])

  defp next_prime(number) do
    if is_prime(number+1), do: number+1, else: next_prime(number+1)
  end


  defp is_prime(2), do: true
  defp is_prime(number) do
    limit = ceil(:math.sqrt(number))
    Enum.find(2..limit, fn(x) -> rem(number, x) == 0 end) == nil
  end
end
