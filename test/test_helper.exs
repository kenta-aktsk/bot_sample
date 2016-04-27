ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BotSample.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BotSample.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BotSample.Repo)

