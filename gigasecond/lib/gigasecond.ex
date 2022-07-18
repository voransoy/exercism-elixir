defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    dt =
      %DateTime{
        year: year,
        month: month,
        day: day,
        hour: hours,
        minute: minutes,
        second: seconds,
        zone_abbr: "UTC",
        utc_offset: 0,
        std_offset: 0,
        time_zone: "Etc/UTC"
      }
      |> DateTime.add(10 ** 9)

    {{dt.year, dt.month, dt.day}, {dt.hour, dt.minute, dt.second}}
  end
end
