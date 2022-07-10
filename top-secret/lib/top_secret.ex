defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({f, _, [{:when, _, [{name, _, params} | _]}, _]} = ast, acc)
      when f in [:def, :defp] do
    {ast, [String.slice(to_string(name), 0, length(params || [])) | acc]}
  end

  def decode_secret_message_part({f, _, [{name, _, params}, _]} = ast, acc)
      when f in [:def, :defp] do
    {ast, [String.slice(to_string(name), 0, length(params || [])) | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  def decode_secret_message(string) do
    {_, mod} =
      string
      |> to_ast()
      |> Macro.prewalk([], &decode_secret_message_part/2)

    mod |> Enum.reverse() |> Enum.join("")
  end
end
