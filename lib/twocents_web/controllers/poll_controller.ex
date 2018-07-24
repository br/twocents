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
  # STATE 0 -> CHANGES TO POLL TITLE + CHOICE TITLE ALLOWED
  # def update(conn, %{"poll_id" => id, "poll" => poll_params, "title" => new_title, "state" => 0}) do
  #    # voting is not opened so changes to poll title allowed
  #    # get poll from repo with poll_id
  #    poll = Repo.get!(Poll, id)
  #    # change title
  #    updated_title = Ecto.Changeset.change(poll, title: new_title)
  #    # push updated_title to repo
  #    Repo.update(updated_title)
  #    changeset = Poll.changeset(poll, poll_params)
  #    case Repo.update(changeset) do
  #      {:ok, changeset} ->
  #        conn
  #        |> redirect(to: poll_path(conn, :show, poll))
  #      {:error, changeset} ->
  #        conn
  #        |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
  #    end
  # end
  # STATE 0 -> CHANGES TO POLL TITLE + CHOICE TITLE ALLOWED
  # def update(conn, %{"poll_id" => id, "poll" => poll_params, "state" => 0, "id" => choice_id, "title" => new_title}) do
  #   # if you want to edit choice title
  #   # preload choices of poll_id
  #   poll = Repo.get!(Poll, id)
  #   old_choice = Repo.get!(Choice, choice_id)
  #   new_choice = Ecto.Changeset.change old_choice, title: new_title
  #   case Repo.update(new_choice) do
  #     {:ok, new_choice} ->
  #       conn
  #       |> redirect(to: poll_path(conn, :show, poll))
  #     {:error, new_choice} ->
  #       conn
  #       |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end
  # STATE 1 -> CHANGES TO TOTAL VOTES + CHOICE VOTES ALLOWED ONLY
  def update(conn, %{"poll_id" => poll_id, "choice_id" => choice_id, "poll" => poll_params}) do #"state" => 1
    # voting is open, only update/increment choice.votes and poll.totalvotes
    poll = Repo.get!(Poll, poll_id)
    poll = Repo.preload(poll, :choices)
    choice = Repo.get!(Choice, choice_id)
    choice = Ecto.Changeset.change choice, votes: choice.votes + 1
    totalvotes = Ecto.Changeset.change poll, totalvotes: poll.totalvotes + 1
    Repo.update(totalvotes)
    Repo.update(choice)
    changeset = Poll.changeset(poll, poll_params)
    case Repo.update(changeset) do
      {:ok, changeset} ->
        conn
        |> redirect(to: poll_path(conn, :show, poll))
      {:error, changeset} ->
        conn
        |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
   end
  end

  def update(conn, _params) do
    json conn |> put_status(:not_found), %{errors: ["poll_id and choice_id required"]}
  end

  def delete(conn, %{"id" => id}) do
    poll = Repo.get!(Poll, id)
    Repo.delete!(poll)

    conn
    #|> put_flash(:info, "Poll deleted successfully.")
    |> redirect(to: poll_path(conn, :index))
  end
end
