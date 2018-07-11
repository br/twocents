defmodule Twocents.ChoiceTest do
  use Twocents.ModelCase

  alias Twocents.Choice

  @valid_attrs %{votes: 42, title: "some title"}
  @invalid_attrs %{}

  setup do
    poll = %Poll{title: "Hello World"} |> Repo.insert!
    %Choice{title: "Hello to you too!", poll_id: poll.id }
    |> Repo.insert!
    %Choice{title: "How are you doing?", poll_id: poll.id }
    |> Repo.insert!

    {:ok, poll: poll}
  end

  test "retreive choice counts", context do
    poll = Poll
    |> Repo.get(context[:poll].id)
    |> Repo.preload(:choices)

    assert Enum.count(poll.choices) == 2
  end
end
