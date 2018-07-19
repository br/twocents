defmodule TwocentsWeb.ChoiceView do
  use TwocentsWeb, :view

  def render("index.json", %{choices: choices}) do
    %{data: render_many(choices, TwocentsWeb.ChoiceView, "choice.json")}
  end

  def render("choice.json", %{choice: choice}) do
    %{
      title: choice.title,
      id: choice.id,
      votes: choice.votes
    }
  end
end
