defmodule Auth.Cache do
  use Nebulex.Cache,
    otp_app: :twotter,
    adapter: Nebulex.Adapters.Local
end
