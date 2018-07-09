defmodule Twocents.Repo.Migrations.CreateChoices do
  use Ecto.Migration

  def change do
    create table(:choices) do
      add :title, :string
      add :votes, :integer
      add :poll_id, references(:polls, on_delete: :nothing)

      timestamps()
    end

    create index(:choices, [:poll_id])
  end
end
