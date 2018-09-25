use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rock_paper_scissors, RockPaperScissorsWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rock_paper_scissors, RockPaperScissors.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rock_paper_scissors_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
