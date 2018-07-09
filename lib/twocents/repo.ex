defmodule Twocents.Repo do
  use Ecto.Repo, otp_app: :twocents

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
  adapter: Ecto.Adapters.Postgres,
  username: "msampaga",
  password: "postgres",
  database: "twocents_dev",
  hostname: "localhost",
  pool_size: 10
end
