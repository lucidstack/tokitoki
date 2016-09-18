use Mix.Config

config :tokitoki, Tokitoki.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: "Tokitoki",
  aka: "/",
  responders: [
    {Hedwig.Responders.Help, []},
    {Tokitoki.Responders.Greeting, []},
  ],
  # hedwig-slack stuff
  token: {:system, "SLACK_TOKEN"},
  rooms: []
