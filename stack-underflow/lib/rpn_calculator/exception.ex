defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) do
      case value do
        [] -> %__MODULE__{}
        _ -> %__MODULE__{message: "stack underflow occurred, context: #{value}"}
      end
    end
  end

  def divide(list) when length(list) < 2,
    do: raise(RPNCalculator.Exception.StackUnderflowError, "when dividing")

  def divide(list) do
    case list do
      [0 | _] -> raise RPNCalculator.Exception.DivisionByZeroError
      [a | [b | _]] -> b / a
    end
  end
end
