# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cronwithregistry,
  ecto_repos: [Cronwithregistry.Repo]

# Configures the endpoint
config :cronwithregistry, CronwithregistryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UJL97nPxDmG16lZGKtagEe+EyN8j/49iNKmpIkDHnEEgJJUJGBycHUo7iDxv+DAk",
  render_errors: [view: CronwithregistryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cronwithregistry.PubSub,
  live_view: [signing_salt: "FDNJYfBV1/KCXYxc9l6N7R+2n2ChlO4j"],
  jobs: [
    application_task: [
      schedule: {:extended, "1 * * * *"},
      task: {QuantumExample, :app_task, []}
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :cronwithregistry, Notificacion,
  jobs: [
    application_task: [
      schedule: {:extended, "1 * * * *"},
      task: {QuantumExample, :app_task, []}
    ]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
