defmodule Twotter.Twoots do
  @moduledoc """
  The Twoots context.
  """

  import Ecto.Query, warn: false
  alias Twotter.Repo

  alias Twotter.Twoots.Twoot

  @doc """
  Returns the list of twoots.

  ## Examples

      iex> list_twoots()
      [%Twoot{}, ...]

  """
  def list_twoots do
    Repo.all(Twoot)
  end

  @doc """
  Gets a single twoot.

  Raises `Ecto.NoResultsError` if the Twoot does not exist.

  ## Examples

      iex> get_twoot!(123)
      %Twoot{}

      iex> get_twoot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_twoot!(id), do: Repo.get!(Twoot, id)

  @doc """
  Creates a twoot.

  ## Examples

      iex> create_twoot(%{field: value})
      {:ok, %Twoot{}}

      iex> create_twoot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_twoot(attrs \\ %{}) do
    %Twoot{}
    |> Twoot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a twoot.

  ## Examples

      iex> update_twoot(twoot, %{field: new_value})
      {:ok, %Twoot{}}

      iex> update_twoot(twoot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_twoot(%Twoot{} = twoot, attrs) do
    twoot
    |> Twoot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Twoot.

  ## Examples

      iex> delete_twoot(twoot)
      {:ok, %Twoot{}}

      iex> delete_twoot(twoot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_twoot(%Twoot{} = twoot) do
    Repo.delete(twoot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking twoot changes.

  ## Examples

      iex> change_twoot(twoot)
      %Ecto.Changeset{source: %Twoot{}}

  """
  def change_twoot(%Twoot{} = twoot) do
    Twoot.changeset(twoot, %{})
  end
end
