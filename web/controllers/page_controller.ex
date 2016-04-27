defmodule BotSample.PageController do
  use BotSample.Web, :controller
  alias BotSample.Bot

  def index(conn, _params) do
    render conn, "index.html"
  end

  def callback(conn, %{"messages" => messages} = _params) do
    Bot.process_messages(messages)
    json conn, %{ok: "ok"}
  end
end
