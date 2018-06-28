defmodule Twocents.Repo.Migrations.CreateUp do
  use Ecto.Migration

  def change do
    create table(:up) do

      timestamps()
    end
  end
end
