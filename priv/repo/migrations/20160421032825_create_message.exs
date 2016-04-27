defmodule BotSample.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages, options: "ROW_FORMAT=DYNAMIC") do
      add :value, :string

      timestamps
    end
  end
end
