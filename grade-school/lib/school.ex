defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    []
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    case Enum.find(school, &(&1.name == name)) do
      nil -> {:ok, [%{name: name, grade: grade} | school]}
      _ -> {:error, school}
    end
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    Enum.reduce(school, [], fn s, acc -> if s.grade == grade, do: [s.name | acc], else: acc end)
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    Enum.sort_by(school, &{&1.grade, &1.name})
    |> Enum.map(& &1.name)
  end
end
