defmodule TwocentsWeb.PollView do
  use TwocentsWeb, :view

  def render("index.json", %{polls: polls}) do
    %{data: render_many(polls, TwocentsWeb.PollView, "poll.json")}
  end

  def render("show.json", %{poll: poll}) do
    %{data: render_one(poll, TwocentsWeb.PollView, "poll.json")}
  end

  def render("poll.json", %{poll: poll}) do
    %{
      title: poll.title,
      id: poll.id,
      closed: poll.closed,
      choices: %{
        #Twocents.Repo.preload
        #(Twocents.Repo.get(Twocents.Poll,
        # poll.id), :choices)
      }
    }
  end
end
