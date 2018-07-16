defmodule Twocents.Poll do
  @moduledoc """
  TwoCents Poll
  """
  use TwocentsWeb, :model
  use Ecto.Schema

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
    #|>validate_number(changeset, :choice, greater_than: 1, less_than: 5)
  end
end
