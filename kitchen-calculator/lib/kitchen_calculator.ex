defmodule KitchenCalculator do
  def get_volume({_, n}), do: n

  def to_milliliter({:cup, n}), do: {:milliliter, n * 240}
  def to_milliliter({:fluid_ounce, n}), do: {:milliliter, n * 30}
  def to_milliliter({:teaspoon, n}), do: {:milliliter, n * 5}
  def to_milliliter({:tablespoon, n}), do: {:milliliter, n * 15}
  def to_milliliter({:milliliter, n}), do: {:milliliter, n}

  def from_milliliter({:milliliter, volume}, unit) do
    {_, multiplier} = to_milliliter({unit, 1})
    {unit, volume / multiplier}
  end

  def convert({sunit, volume}, unit) do
    from_milliliter(to_milliliter({sunit, volume}), unit)
  end
end
