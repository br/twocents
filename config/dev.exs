use Mix.Config

config :twocents, TwocentsWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../assets", __DIR__)]]

config :twocents, TwocentsWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/twocents_web/views/.*(ex)$},
      ~r{lib/twocents_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :twocents, Twocents.Repo,
 adapter: Ecto.Adapters.Postgres,
 username: System.get_env("POSTGRES_USERNAME") || "msampaga",
 password: System.get_env("POSTGRES_PASSWORD") || "postgres",
 database: "twocents_dev",
 hostname: System.get_env("POSTGRES_HOSTNAME") || "localhost",
 pool_size: 10
