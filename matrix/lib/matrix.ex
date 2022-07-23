defmodule Matrix do
  defstruct matrix: nil

  import Kernel, except: [to_string: 1]

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn r -> r |> String.split(" ") |> Enum.map(&String.to_integer/1) end)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    Enum.map_join(matrix, "\n", fn row ->
      Enum.map_join(row, " ", &Integer.to_string/1)
    end)
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(matrix, index - 1)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    Enum.reduce(matrix, List.duplicate([], length(hd(matrix))), fn row, acc ->
      Enum.map(0..(length(acc) - 1), fn i -> [Enum.at(row, i) | Enum.at(acc, i)] end)
    end)
    |> Enum.map(&Enum.reverse/1)
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    Enum.at(columns(matrix), index - 1)
  end
end
