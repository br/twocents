defmodule Twocents.PollTest do
  use Twocents.ModelCase

  alias Twocents.Poll

  @valid_attrs %{closed: true, title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Poll.changeset(%Poll{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Poll.changeset(%Poll{}, @invalid_attrs)
    refute changeset.valid?
  end
end
