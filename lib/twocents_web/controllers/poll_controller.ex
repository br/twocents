defmodule TwocentsWeb.PollController do
  @moduledoc """
  TwoCents PollController
  """
  use TwocentsWeb, :controller
  import Ecto.Query
  import Ecto.Changeset

  alias Twocents.{Repo, Poll, Choice}

  plug :scrub_params, "poll" when action in [:create, :update]

  def index(conn, _params) do
    polls = Poll
    |> Repo.all()
    |> Repo.preload([:choices])
    conn
    |> render("index.json", polls: polls)
  end

  def new(conn, _params) do
    changeset = Poll.changeset(%Poll{})

    conn
    |> render("show.json", changeset: changeset)
  end

  #takes poll and inserts into repo and confirms
  #whether or not poll insert to repo was successful
  def create(conn, %{"poll" => poll_params}) do
    changeset = Poll.changeset(%Poll{}, poll_params)
    case Repo.insert(changeset) do
      {:ok, _poll} ->
        conn
        |> redirect(to: poll_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    choice_query = from c in Choice, order_by: [asc: c.id], limit: 4
    poll_query  = from p in Poll, preload: [choices: ^choice_query]
    poll = Repo.get!(poll_query, id)
    render(conn, "show.json", poll: poll)
  end

  def edit(conn, %{"id" => id}) do
    poll = Repo.get!(Poll, id)
    changeset = Poll.changeset(poll)
    render(conn, "edit.html", poll: poll, changeset: changeset)
  end

  #get poll_id, choice_id; increment choice.votes
  def update(conn, %{"poll_id" => id, "poll" => poll_params, "id" => choiceID}) do
    poll = Repo.get!(Poll, id)
    poll = Repo.preload(poll, :choices)
    choice = Repo.get!(Choice, choiceID)
    choice = Ecto.Changeset.change choice, votes: choice.votes + 1
    vote_total = Ecto.Changeset.change poll, vote_count: poll.vote_count + 1
    changeset = Poll.changeset(poll, poll_params)
    case Repo.update(choice) do #originally (changeset)
      {:ok, choice} ->
        conn
      #|> put_flash(:info, "Poll updated successfully.")
        |> redirect(to: poll_path(conn, :show, poll))
      {:error, changeset} ->
        render(conn, Twocents.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    poll = Repo.get!(Poll, id)
    Repo.delete!(poll)

    conn
    |> put_flash(:info, "Poll deleted successfully.")
    |> redirect(to: poll_path(conn, :index))
  end
end
