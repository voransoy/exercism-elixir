defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    keys = String.split(path, ".")
    extract(data, keys)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end

  defp extract(data, []), do: data
  defp extract(data, [ key | rem_keys]), do: extract(data[key], rem_keys)
end
