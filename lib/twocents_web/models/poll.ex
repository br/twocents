defmodule Twocents.Poll do
  @moduledoc """
  TwoCents Poll
  """
  use TwocentsWeb, :model
  use Ecto.Schema
  import Ecto.Changeset
  schema "polls" do
    field :title, :string
    field :closed, :boolean, default: false

    has_many :choices, Twocents.Choice, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:title, :closed])
    |> validate_required([:title, :closed])
    |> unique_constraint(:title)
    |> cast_assoc(:choices)
  end
end
