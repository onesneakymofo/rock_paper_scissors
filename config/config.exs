# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rock_paper_scissors,
  ecto_repos: [RockPaperScissors.Repo]

# Configures the endpoint
config :rock_paper_scissors, RockPaperScissorsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/7E21uFjdYFXyrsb2yMAqHPbO7UKodDfuY3htAlXO/6OPZ6/k+14i38ZSAGM7xiv",
  render_errors: [view: RockPaperScissorsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RockPaperScissors.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
