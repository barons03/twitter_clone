defmodule Twotter.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Argon2

  schema "users" do
    field :username, :string
    field :password, :string
    field :password_unhashed, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password_unhashed])
    |> validate_required([:username, :password_unhashed])
    |> validate_length(:password_unhashed, max: 1024, min: 3)
    |> validate_length(:username, max: 30, min: 1)
    |> unique_constraint(:username)
    |> hash_password
  end

  def hash_password(changeset) do
    password_unhashed = get_field(changeset, :password_unhashed)
    hashed_password = Argon2.hashpwsalt(password_unhashed)
    changeset
    |> put_change(:password, hashed_password)
  end
end
