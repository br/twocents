defmodule Twocents.UpTest do
  use Twocents.DataCase

  alias Twocents.Up

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Up.changeset(%Up{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Up.changeset(%Up{}, @invalid_attrs)
    assert changeset.valid?
  end
end
