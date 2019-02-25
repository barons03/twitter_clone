# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twotter, Auth.Cache,
  gc_interval: 86_400 # 24 hrs


config :twotter,
  ecto_repos: [Twotter.Repo]

# Configures the endpoint
config :twotter, TwotterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a1yIR3mgD4uY3DX7ulK8LHyi+r8d1N11nPrs5I4F6cuQWN3uztTuDDZ+3P7H+ZAj",
  render_errors: [view: TwotterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Twotter.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
