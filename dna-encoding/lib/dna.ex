defmodule DNA do

  @dna_map [
    {?\s, 0b0000},
    {?A, 0b0001},
    {?C, 0b0010},
    {?G, 0b0100},
    {?T, 0b1000},
  ]

  def encode_nucleotide(code_point) do
    find_by_key(@dna_map, code_point)
  end

  def decode_nucleotide(encoded_code) do
    find_by_value(@dna_map, encoded_code)
  end

  def encode(dna) do
    dna_encode(dna, <<>>)
  end

  def decode(dna) do
    dna_decode(dna, '')
  end

  def find_by_key([], _key), do: nil
  def find_by_key([ {k,v} | _ ], key) when k==key, do: v
  def find_by_key([ _ | tail ], key), do: find_by_key(tail, key)

  def find_by_value([], _key), do: nil
  def find_by_value([ {k,v} | _ ], key) when v==key, do: k
  def find_by_value([ _ | tail ], key), do: find_by_value(tail, key)

  def dna_encode([], acc), do: acc
  def dna_encode([ h | t ], acc) do
    dna_encode(t, <<acc::bitstring, encode_nucleotide(h)::4>>)
  end

  def dna_decode(<<>>, acc), do: acc |> reverse_list('')
  def dna_decode(<<value::4, rest::bitstring>>, acc) do
    dna_decode(rest, [decode_nucleotide(value) | acc])
  end

  def reverse_list([], acc), do: acc
  def reverse_list([ h | t], acc), do: reverse_list(t, [h|acc])

end
