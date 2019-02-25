defmodule Twotter.Repo.Migrations.CreateTwoots do
  use Ecto.Migration

  def change do
    create table(:twoots) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:twoots, [:user_id])
  end
end
