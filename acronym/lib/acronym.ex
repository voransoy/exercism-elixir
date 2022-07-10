defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace("'", "")
    |> String.replace( ~r/(?<![A-Z])[A-Z]/, fn c -> " " <> c end)
    |> String.split(~r/[^a-zA-Z]/)
    |> Enum.filter(fn s -> String.length(s) > 0 end)
    |> Enum.map(&String.first/1)
    |> Enum.map(&String.upcase/1)
    |> Enum.join("")
  end
end
