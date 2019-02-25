use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :twotter, TwotterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :twotter, Twotter.Repo,
  username: "postgres",
  password: "postgres",
  database: "twotter_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
