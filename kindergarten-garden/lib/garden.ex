defmodule Garden do
  @names [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @plants %{
    "V" => :violets,
    "C" => :clover,
    "G" => :grass,
    "R" => :radishes
  }
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @names) do
    [row_a, row_b] = String.split(info_string)
    snames = Enum.sort(student_names)
    list = zip_with_names(row_a, snames) ++ zip_with_names(row_b, snames)

    Enum.reduce(list, Map.new(snames, fn x -> {x, {}} end), fn {p, u}, acc ->
      Map.put(acc, u, Enum.reduce(p, acc[u], &Tuple.append(&2, &1)))
    end)
  end

  def zip_with_names(row, names) do
    Enum.map(String.graphemes(row), &Map.get(@plants, &1))
    |> Enum.chunk_every(2)
    |> Enum.zip(names)
  end
end
