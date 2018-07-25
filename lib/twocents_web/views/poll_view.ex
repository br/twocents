defmodule TwocentsWeb.PollView do
  use TwocentsWeb, :view
  alias TwocentsWeb.ChoiceView

  def render("index.json", %{polls: polls}) do
    %{data: render_many(polls, TwocentsWeb.PollView, "poll.json")}
  end

  def render("show.json", %{poll: poll}) do
    %{data: render_one(poll, TwocentsWeb.PollView, "poll.json")}
  end
  #formats poll information view   
  def render("poll.json", %{poll: poll}) do
    %{
      title: poll.title,
      poll_id: poll.id,
      choices: render_many(poll.choices, ChoiceView, "choice.json"),
      totalvotes: poll.totalvotes,
      state: poll.state
    }
  end
end
