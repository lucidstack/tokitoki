use Mix.Config

config :tokitoki, Tokitoki.Robot,
  adapter: Hedwig.Adapters.Test,
  name: "Tokitoki",
  aka: "/",
  responders: [
    {Hedwig.Responders.Help, []},
    {Tokitoki.Responders.Greeting, []},
  ]
