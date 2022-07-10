defmodule Username do

  @conversions %{
    ?ß => 'ss',
    ?ä => 'ae',
    ?ö => 'oe',
    ?ü => 'ue'
  }
  def sanitize(username) do
    letters = 'abcdefghijklmnopqrstuvwxyz_' ++ [?ß, ?ä, ?ö, ?ü]
    Enum.filter(username, fn x -> x in letters end)
    |> Enum.reduce([], fn x,r ->
      case x in [?ß, ?ä, ?ö, ?ü] do
        true -> r ++ @conversions[x]
        false -> r ++ [x]
      end
    end)
  end
end
