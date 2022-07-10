defmodule SecretHandshake do
  use Bitwise

  @codes %{
    0b00001 => "wink",
    0b00010 => "double blink",
    0b00100 => "close your eyes",
    0b01000 => "jump"
  }

  def commands(code) do
    list = Enum.reduce(@codes, [], fn ({k,v}, acc) ->
      if (code &&& k) == k, do: acc ++ [v], else: acc
    end)
    case code &&& 0b10000 do
      0b10000 -> Enum.reverse(list)
      _ -> list
    end
  end
end
