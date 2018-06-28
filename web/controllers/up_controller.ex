defmodule Twocents.UpController do
  use Twocents.Web, :controller

  alias Twocents.Up

  def index(conn, _params) do
    up = Repo.all(Up)
    render(conn, "index.json", up: up)
  end

  def create(conn, %{"up" => up_params}) do
    changeset = Up.changeset(%Up{}, up_params)

    case Repo.insert(changeset) do
      {:ok, up} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", up_path(conn, :show, up))
        |> render("show.json", up: up)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    up = Repo.get!(Up, id)
    render(conn, "show.json", up: up)
  end

  def update(conn, %{"id" => id, "up" => up_params}) do
    up = Repo.get!(Up, id)
    changeset = Up.changeset(up, up_params)

    case Repo.update(changeset) do
      {:ok, up} ->
        render(conn, "show.json", up: up)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Twocents.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    up = Repo.get!(Up, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(up)

    send_resp(conn, :no_content, "")
  end
end
