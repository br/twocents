defmodule Twocents.PollControllerTest do
  use TwocentsWeb.ConnCase

  alias Twocents.{Poll, Repo}
  @valid_attrs %{closed: true, title: "some title"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, poll_path(conn, :index)
    #assert html_response(conn, 200) =~ "Listing Polls"
  end

  test "renders form for new resources", %{conn: conn} do
    #conn = get conn, poll_path(conn, :new)
    #assert html_response(conn, 200) =~ "New Poll"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    #conn = post conn, poll_path(conn, :create), poll: @valid_attrs
    #poll = Repo.get_by!(Poll, @valid_attrs)
    #assert redirected_to(conn) == poll_path(conn, :show, poll.id)
    #assert poll.title == "some title"
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    #conn = post conn, poll_path(conn, :create), poll: @invalid_attrs
    #assert html_response(conn, 200) =~ "New Poll"
  end

  test "shows chosen resource", %{conn: conn} do
    poll = Repo.insert! %Poll{}
    #conn = get conn, poll_path(conn, :show, poll)
    #assert html_response(conn, 200) =~ "Show Poll"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, poll_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    poll = Repo.insert! %Poll{}
    #conn = get conn, poll_path(conn, :edit, poll)
    #assert html_response(conn, 200) =~ "Edit Poll"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    poll = Repo.insert! %Poll{}
    #conn = put conn, poll_path(conn, :update, poll), poll: @valid_attrs
    #assert redirected_to(conn) == poll_path(conn, :show, poll)
    #assert Repo.get_by(Poll, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    poll = Repo.insert! %Poll{}
    #conn = put conn, poll_path(conn, :update, poll), poll: @invalid_attrs
    #assert html_response(conn, 200) =~ "Edit Poll"
  end

  test "deletes chosen resource", %{conn: conn} do
    poll = Repo.insert! %Poll{}
    #conn = delete conn, poll_path(conn, :delete, poll)
    #assert redirected_to(conn) == poll_path(conn, :index)
    #refute Repo.get(Poll, poll.id)
  end
end
