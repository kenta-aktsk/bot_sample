defmodule BotSample.Message do
  use BotSample.Web, :model

  schema "messages" do
    field :value, :string

    timestamps
  end

  @required_fields ~w(value)a
  @optional_fields ~w()a

  def changeset(message, params \\ %{}) do
    message
    |> cast(params, @required_fields, @optional_fields)
  end
end
