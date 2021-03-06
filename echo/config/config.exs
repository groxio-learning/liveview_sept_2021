# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :echo,
  ecto_repos: [Echo.Repo]

# Configures the endpoint
config :echo, EchoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z+QBox9S7RlR21T0OwaXKqBdFd2zsiFIvnxpfXj5yeaQjejWv9tauygbLEcMiUoX",
  render_errors: [view: EchoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Echo.PubSub,
  live_view: [signing_salt: "NgUrAeBS"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
