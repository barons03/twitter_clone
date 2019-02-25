defmodule Twotter.Repo do
  use Ecto.Repo,
    otp_app: :twotter,
    adapter: Ecto.Adapters.Postgres
end
