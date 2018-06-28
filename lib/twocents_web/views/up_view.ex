defmodule TwocentsWeb.UpView do
  use TwocentsWeb, :view

  def render("index.json", %{up: up}) do
    %{data: render_many(up, Twocents.UpView, "up.json")}
  end

  def render("show.json", %{up: up}) do
    %{data: render_one(up, Twocents.UpView, "up.json")}
  end

  def render("up.json", %{up: up}) do
    %{id: up.id}
  end
end
