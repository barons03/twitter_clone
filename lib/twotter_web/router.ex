defmodule TwotterWeb.Router do
  use TwotterWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TwotterWeb do
    pipe_through :api
  end
end
