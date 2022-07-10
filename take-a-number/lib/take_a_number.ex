defmodule TakeANumber do
  def start() do
    spawn(fn ->
      wait_message(0)
    end)
  end

  def wait_message(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        wait_message(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        wait_message(state + 1)

      :stop ->
        exit(:normal)

      _ ->
        wait_message(state)
    end
  end
end
