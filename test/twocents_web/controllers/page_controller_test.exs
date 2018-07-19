defmodule TwocentsWeb.PageControllerTest do
  use TwocentsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "WELCOME TO TWOCENTS!"
  end
end
