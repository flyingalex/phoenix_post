# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_post,
  ecto_repos: [PhoenixPost.Repo]

# Configures the endpoint
config :phoenix_post, PhoenixPost.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VDXdwS09VFA6TM3j1WUttUy2pMZ1p/JO/IldvTyhKmcnvM0b8rGv7da6dro9Iku3",
  render_errors: [view: PhoenixPost.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixPost.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
