defmodule Twotter.Accounts.Auth do
  alias Twotter.Accounts.User
  alias Comeonin.Argon2
  alias Twotter.Accounts
  alias Auth.Cache

  def check_password(%User{} = user, password) do
    Argon2.checkpw(password, user.password)
  end

  def insert_token(token, id) do
    Cache.set(token, id)
  end

  def get_token_info(token) do
    case Cache.get(token) do
      nil -> {:error, "Token not found"}
      id -> {:ok, id}
    end
  end

  def get_token_info(token, :db) do
    case Cache.get(token) do
      nil -> {:error, "Token not found"}
      id ->
       case Accounts.get_user(id) do
         nil -> {:error, "User not found"}
         user -> {:ok, user}
       end
    end
  end

  def login(username, password) do
    case Accounts.get_user_by_username(username) do
      nil ->
        Argon2.dummy_checkpw()
        {:error, "User not found"}
      user ->
      case check_password(user, password) do
        true ->
          uuid = user_uuid()
          insert_token(uuid, user.id)
          {:ok, uuid}
        false -> {:error, "Password incorrect"}
      end
    end
  end

  def user_uuid() do
    UUID.uuid4()
  end
end