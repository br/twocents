defmodule TwocentsWeb.PageController do
  use TwocentsWeb, :controller

  def index(conn, _params) do
    render conn, "newpoll.html"
  end
end
