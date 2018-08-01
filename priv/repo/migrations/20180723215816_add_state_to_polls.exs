defmodule Twocents.Repo.Migrations.AddStateToPolls do
  use Ecto.Migration

  def change do
    alter table(:polls) do
      add :state, :integer, default: 0
      # 0 -> before poll is open, all changes available
      # 1 -> poll is open, only choice increments available
      # 2 -> poll is closed, no changes can be made
    end
  end
end
