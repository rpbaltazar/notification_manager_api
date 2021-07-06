# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :notification_manager_api,
  ecto_repos: [NotificationManagerApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :notification_manager_api, NotificationManagerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ynJzs/K5WtlW2OkZOOljYK+ruHXWR4ZWmwMtUFR8iNJl+snkb4t5H87OJtUrL2i4",
  render_errors: [view: NotificationManagerApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NotificationManagerApi.PubSub,
  live_view: [signing_salt: "eDG9aXim"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
