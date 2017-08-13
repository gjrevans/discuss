# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6atKsemFW1mrlXvugdNroY4psovqjDVgqhamGvPpUyIiv928mC7ml1RiOvGutAja",
  render_errors: [view: Discuss.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Ueberauth Config
config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

# Ueberauth Github Config
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "cacbefa45229bac284a0",
  client_secret: "6fab27ef622dc734642e16d5d79aff34f1d857a1"
