defmodule Darts do
  @type position :: {number, number}
  @points [{10, 1}, {5, 5}, {1, 10}]
  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    Enum.reduce(@points, 0, fn({rad, point}, acc) ->
      if :math.sqrt(x**2 + y**2) <= rad, do: point, else: acc
    end)
  end
end
