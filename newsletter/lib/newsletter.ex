defmodule Newsletter do
  def read_emails(path) do
    with {:ok, mails} <- File.read(path) do
      mails |> String.split()
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log_file = open_log(log_path)
    with emails <- read_emails(emails_path) do
      Enum.each(emails, fn email ->
        if send_fun.(email) == :ok, do: log_sent_email(log_file, email)
      end)
    end
    close_log(log_file)
  end
end
