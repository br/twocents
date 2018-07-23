defmodule Twocents.Up do
  @moduledoc """
  TwoCents Up
  """
 use Ecto.Schema

  schema "up" do

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    import Ecto.Changeset
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
