defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([h|t]=_list), do: [h+1|t]

  def has_day_without_birds?([]=_list), do: false
  def has_day_without_birds?([h|t]=_list) do
    case h do
      0 -> true
      _ -> has_day_without_birds?(t)
    end
  end

  def total([]), do: 0
  def total([h|t]=_list), do: h + total(t)

  def busy_days([]), do: 0
  def busy_days([h|t]=_list) do
    case h>4 do
      false -> busy_days(t)
      true -> 1 + busy_days(t)
    end
  end
end
