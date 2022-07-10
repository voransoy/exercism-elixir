defmodule SpaceAge do
  def age_on(:earth, seconds), do: seconds / 31557600
  def age_on(:mercury, seconds), do: seconds / 31557600 / 0.2408467
  def age_on(:venus, seconds), do: seconds / 31557600 / 0.61519726
  def age_on(:mars, seconds), do: seconds / 31557600 / 1.8808158
  def age_on(:jupiter, seconds), do: seconds / 31557600 / 11.862615
  def age_on(:saturn, seconds), do: seconds / 31557600 / 29.447498
  def age_on(:uranus, seconds), do: seconds / 31557600  / 84.016846
  def age_on(:neptune, seconds), do: seconds / 31557600  / 164.79132
end
