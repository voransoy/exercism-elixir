defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @map %{
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }
  @scale %{
    1_000_000_000 => "billion",
    1_000_000 => "million",
    1_000 => "thousand",
    100 => "hundred"
  }

  @spec in_english(integer) :: {atom, String.t()}
  def in_english(0), do: {:ok, "zero"}

  def in_english(number) when number not in 1..999_999_999_999, do: {:error, "number is out of range"}

  def in_english(number) do
    {:ok, number |> say() |> String.trim()}
  end

  def say(number) when number <= 20, do: Map.get(@map, number)

  def say(number) when number < 100 do
    case rem(number, 10) do
      0 -> @map[div(number, 10) * 10]
      r -> "#{@map[div(number, 10) * 10]}-#{say(r)}"
    end
  end

  def say(number) do
    d = Enum.filter(Map.keys(@scale), fn(s) -> s <= number end) |> Enum.max()
    "#{say(div(number, d))} #{@scale[d]} #{say(rem(number, d))}"
  end
end
