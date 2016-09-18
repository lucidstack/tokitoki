defmodule Tokitoki.Responders.Conversational do
  use Hedwig.Responder

  @presentation """
  I am Tokitoki, a bot! Every morning, I will reply
  to the first person in the team with a different greeting
  from around the world! 🌍
  """ |> String.replace("\n", " ")


  respond ~r/(who|what) are you?/i, msg do
    reply msg, @presentation
  end

  hear ~r/(who|what)('s| is) @?tokitoki/i, msg do
    send msg, @presentation
  end
end

