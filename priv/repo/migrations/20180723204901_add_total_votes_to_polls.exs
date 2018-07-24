defmodule Twocents.Repo.Migrations.AddTotalVotesToPolls do
  use Ecto.Migration

  def change do
    alter table(:polls) do
      add :totalvotes, :integer, default: 0
    end
  end
end
