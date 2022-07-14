defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.replace(~r/[^0-9a-zA-Z]/, "")
    |> String.downcase
    |> String.to_charlist
    |> Enum.map(fn x ->
      if x >= 97 and x <= 122, do: 122 - (x - 97), else: x
    end)
    |> Enum.chunk_every(5)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(~r/[^0-9a-zA-Z]/, "")
    |> String.to_charlist
    |> Enum.map(fn x ->
      if x >= 97 and x <= 122, do: 97 + (122 - x), else: x
    end)
    |> List.to_string
  end
end
