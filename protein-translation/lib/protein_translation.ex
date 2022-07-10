defmodule ProteinTranslation do
  @pairs %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    [h|t] = String.split(rna, ~r/.{3}/, include_captures: true, trim: true)
            |> Enum.map(fn x -> @pairs[x] end)
            |> Enum.chunk_by(fn x -> x == "STOP" end)
    case Enum.find(h, :ok, fn x -> x==nil end) do
      :ok -> {:ok, h}
      _ -> {:error, "invalid RNA"}
    end

  end

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @pairs[codon] do
      nil -> {:error, "invalid codon"}
      _ ->  {:ok, @pairs[codon]}
    end
  end

end
