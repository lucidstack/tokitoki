defmodule Tokitoki.Responders.Greeting do
  alias Tokitoki.{GreetingsRepo,CountryDiscovery}
  use Hedwig.Responder

  hear ~r/(good )?morning/i, msg do
    greeting = GreetingsRepo.random_greeting

    response = ""
    |> add_greeting(greeting["Greeting"])
    |> add_flag(greeting["Countries"])
    |> add_language(greeting["Language"])

    send msg, response
  end

  defp add_greeting response, greeting do
    response <> greeting <> "! :wave:"
  end

  defp add_flag response, country_name do
    response <> " " <> (country_name |> CountryDiscovery.find |> make_flag)
  end

  defp add_language response, language do
    response <> " (in #{language})"
  end

  defp make_flag(nil), do: ""
  defp make_flag([%{"alpha2Code" => iso2}]), do: " :flag-#{iso2}:"
end
