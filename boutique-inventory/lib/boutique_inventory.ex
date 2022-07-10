defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x[:price] == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn x ->
      Map.put(x, :name, String.replace(x[:name], old_word, new_word))
    end)
  end

  def increase_quantity(item, count) do
    Map.put(
      item,
      :quantity_by_size,
      Enum.into(item[:quantity_by_size], Map.new(), fn {k, v} -> {k, v + count} end)
    )
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_, y}, acc ->
      acc + y
    end)
  end
end
