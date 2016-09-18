use Mix.Config

config :tokitoki, Tokitoki.Robot,
  adapter: Hedwig.Adapters.Console,
  name: "Tokitoki",
  aka: "tokitoki",
  responders: [
    {Tokitoki.Responders.Greeting, []},
    {Tokitoki.Responders.Conversational, []}
  ]
