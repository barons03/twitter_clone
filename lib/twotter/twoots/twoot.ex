defmodule Twotter.Twoots.Twoot do
  use Ecto.Schema
  import Ecto.Changeset

  alias Twotter.Accounts.User


  schema "twoots" do
    field :body, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(twoot, attrs) do
    twoot
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
    |> assoc_constraint(:user)
  end
end
