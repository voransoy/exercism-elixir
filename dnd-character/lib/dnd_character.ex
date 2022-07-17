defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    floor((score - 10) / 2)
  end

  @spec ability :: pos_integer()
  def ability do
    Enum.map(1..4, fn _ ->
      Enum.random(1..6)
    end)
    |> remove_lowest()
    |> Enum.sum()
  end

  @spec character :: t()
  def character do
    char =
      [:strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma]
      |> Enum.reduce(%DndCharacter{}, fn x, acc -> Map.put(acc, x, ability()) end)

    Map.put(char, :hitpoints, 10 + modifier(char.constitution))
  end

  defp remove_lowest(list), do: list -- [Enum.min(list)]
end
