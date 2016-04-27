# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

{_, osname} = :os.type()
if osname == :darwin && Mix.env == :dev do
  Mix.env(:local)
  System.put_env("MIX_ENV", Atom.to_string(Mix.env))
end

# Configures the endpoint
config :bot_sample, BotSample.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "+aVGM8hfK55VToEWiFoxNPqGzWBNqgyD2n0cihx5EOeou9riE6xcmz2s4Tzw4Z5/",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: BotSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
