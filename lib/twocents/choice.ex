defmodule Twocents.Choice do
  use Ecto.Schema
  import Ecto.Changeset


  schema "choices" do
    field :title, :string
    field :votes, :integer, default: 0
    belongs_to :poll, Twocents.Poll

    timestamps()
  end

  @doc false
  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:title, :votes])
    |> validate_required([:title, :votes])
  end
end
