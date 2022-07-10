defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime),
    do: NaiveDateTime.to_time(datetime) |> Time.compare(~T[12:00:00]) == :lt

  def return_date(checkout_datetime) do
    diff = if before_noon?(checkout_datetime), do: 28, else: 29

    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(diff)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    NaiveDateTime.to_date(actual_return_datetime)
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    1 == NaiveDateTime.to_date(datetime) |> Date.day_of_week()
  end

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)

    late_days =
      datetime_from_string(checkout)
      |> return_date()
      |> days_late(return_datetime)

    if monday?(return_datetime), do: trunc(0.5 * rate * late_days), else: rate * late_days
  end
end
