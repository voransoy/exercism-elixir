defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim() |> String.to_integer()
  end

  def run() do
    result =
      with _ <- welcome(),
           name <- ask_name(),
           class <- ask_class(),
           level <- ask_level() do
        %{class: class, level: level, name: name}
      end
    IO.puts("Your character: %{class: \"#{result.class}\", level: #{result.level}, name: \"#{result.name}\"}")
    result
  end
end
