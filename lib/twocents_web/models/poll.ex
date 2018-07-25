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
    field :state, :integer, default: 0 ## only 0,1,2
    #field :totalvotes, :integer, default: 0
    has_many :choices, Twocents.Choice, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  0 - non-open
  1 - open
  2 - voting has ended
  """
  ### Before voting is open
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:title, :closed])
    |> validate_required([:title, :choices])
    |> unique_constraint(:title)
    |> cast_assoc(:choices)
    |> validate_length(:choices, min: 2, max: 4)
    ## ensure poll state is 0
  end

  #### Poll is open
  # def open_voting_changeset(model, params \\ %{}) do
  #   # ensure poll state is 1
  #   model
  #   |> cast(params, [:totalvotes])
  #   |> validate_required([:totalvotes])
  #   |> cast_assoc(:choices, required: true)
  # end

  #### No changes made if poll is closed, state is 2
  #### Therefore no changeset for state of 2
end
