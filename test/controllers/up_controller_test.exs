defmodule Twocents.UpControllerTest do
  use Twocents.ConnCase

  alias Twocents.Up
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, up_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    up = Repo.insert! %Up{}
    conn = get conn, up_path(conn, :show, up)
    assert json_response(conn, 200)["data"] == %{"id" => up.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, up_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, up_path(conn, :create), up: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Up, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, up_path(conn, :create), up: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    up = Repo.insert! %Up{}
    conn = put conn, up_path(conn, :update, up), up: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Up, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    up = Repo.insert! %Up{}
    conn = put conn, up_path(conn, :update, up), up: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    up = Repo.insert! %Up{}
    conn = delete conn, up_path(conn, :delete, up)
    assert response(conn, 204)
    refute Repo.get(Up, up.id)
  end
end
