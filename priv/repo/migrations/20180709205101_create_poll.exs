defmodule Twocents.Repo.Migrations.CreatePoll do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :title, :string
      add :closed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
