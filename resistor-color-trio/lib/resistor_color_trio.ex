defmodule ResistorColorTrio do
  @color_codes %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    [a, b, c] = Enum.map(colors, &Map.get(@color_codes, &1))
    result = (10 * a + b) * 10 ** c
    if result <= 1000, do: {result, :ohms}, else: {result / 1000, :kiloohms}
  end
end
