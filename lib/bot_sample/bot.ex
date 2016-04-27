defmodule BotSample.Bot do
  alias BotSample.{Repo, Message}

  def process_messages(messages) when is_binary(messages) do
    Task.Supervisor.start_child(BotSample.BotTaskSupervisor, fn -> do_process_messages(messages) end)
  end

  defp do_process_messages(messages) when is_binary(messages) do
    Enum.each String.split(messages, ","), fn(message) ->
      Task.Supervisor.start_child(BotSample.BotTaskSupervisor, fn -> process_message(message) end)
      # process_message(message)
    end
  end

  defp process_message(message) when is_binary(message) do
    :timer.sleep(Enum.random(2000..3000))
    Message |> Repo.get!(1) |> Message.changeset(%{"value" => message}) |> Repo.update!
  end
end
