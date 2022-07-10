defmodule TwoFer do
  def two_fer(name) when is_binary(name), do: "One for #{name}, one for me"
  def two_fer(), do: "One for you, one for me"
  def two_fer(_), do: raise FunctionClauseError
end
