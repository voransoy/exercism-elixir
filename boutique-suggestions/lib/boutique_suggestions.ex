defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, 100.00)

    for t <- tops, b <- bottoms, t.base_color != b.base_color do
      {t, b}
    end
    |> filter_price(max_price)
  end

  def filter_price(list, max_price) do
    for {t, b} <- list, t.price + b.price < max_price do
      {t, b}
    end
  end
end
