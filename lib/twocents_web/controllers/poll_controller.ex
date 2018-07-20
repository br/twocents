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
    changeset =
      Poll.changeset(%Poll{})

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
  def update(conn, %{"id" => id, "poll" => poll_params}) do
    poll = Repo.get!(Poll, id)
    changeset = Poll.changeset(poll, poll_params)
    #vote_up = Repo.get!(Choice, choice.id)
    #vote = Enum.at(poll.choices.id)
    case Repo.update(changeset) do
      {:ok, poll} ->
        conn
        |> put_flash(:info, "Poll updated successfully.")
        |> redirect(to: poll_path(conn, :show, poll))
      {:error, changeset} ->
        render(conn, "edit.html", poll: poll, changeset: changeset)
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
