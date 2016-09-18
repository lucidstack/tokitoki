defmodule Tokitoki.Responders.Conversational do
  use Hedwig.Responder

  respond ~r/who are you/i, msg do
    reply msg, """
      I am Tokitoki, a bot! Every morning, I will reply to the
      first person in the team with a different greeting
      from around the world! 🌍
    """
  end
end

