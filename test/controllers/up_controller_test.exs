defmodule Twocents.UpControllerTest do
  use TwocentsWeb.ConnCase

  test "/up", %{conn: conn} do
    conn = get conn, "/up"
    response = json_response(conn, 200)
    assert Map.has_key?(response, "data")
  end
end
