defmodule Twocents.PollControllerTest do
  use TwocentsWeb.ConnCase

  alias Twocents.{Poll, Repo}
  @valid_attrs %{closed: true, title: "some title"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    conn =
      conn
      |> bypass_through(TwocentsWeb.Router, :browser)
      |> get("/")
    {:ok, %{conn: conn}}
  end
end
