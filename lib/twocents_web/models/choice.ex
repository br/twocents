defmodule Twocents.Choice do
  @moduledoc """
  TwoCents Choice
  """
  use Ecto.Schema
  import Ecto.Changeset
  use TwocentsWeb, :model

  schema "choices" do
    field :title, :string
    field :votes, :integer, default: 0
    belongs_to :poll, Twocents.Poll

    timestamps()
  end

  @required_fields ~w(title votes)
  @optional_fields ~w()

  @doc false
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:title])
  end
end
