defmodule Twocents.Repo.Migrations.CreatePoll do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :title, :string
      add :closed, :boolean, default: false, null: false
      add :vote_count, :integer, default: 0
      timestamps()
    end
  end
end
