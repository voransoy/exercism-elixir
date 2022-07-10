defmodule LogLevel do
  def to_label(level, legacy?) do
    levels = %{
      0 => :trace,
      1 => :debug,
      2 => :info,
      3 => :warning,
      4 => :error,
      5 => :fatal
    }
    legacy_levels = [0 ,5]

    cond do
      levels[level] == nil -> :unknown
      Enum.member?(legacy_levels, level) and legacy? == true -> :unknown
      true -> levels[level]
    end
  end

  def alert_recipient(level, legacy?) do
    # Please implement the alert_recipient/2 function
    cond do
      to_label(level, legacy?) == :unknown and legacy? -> :dev1
      Enum.member?([4,5], level) -> :ops
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end
