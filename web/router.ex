defmodule BotSample.Router do
  use BotSample.Web, :router

  pipeline :browser do
    # plug :accepts, ["html"]
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BotSample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/callback", PageController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", BotSample do
  #   pipe_through :api
  # end
end
