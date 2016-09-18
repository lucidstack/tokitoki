defmodule Tokitoki.GreetingsRepo do
  use GenServer

  def start_link(greetings_path) do
    GenServer.start_link(__MODULE__, [greetings_path], name: __MODULE__)
  end

  # Client interface
  ##################

  def random_greeting do
    GenServer.call(__MODULE__, :random_greeting)
  end

  # GenServer callbacks
  #####################
  def init(greetings_path) do
    greetings = greetings_path
      |> File.stream!
      |> CSV.decode(headers: true)
      |> Enum.into([])

    {:ok, greetings}
  end

  def handle_call(:random_greeting, _from, state) do
    {:reply, state |> Enum.random, state}
  end
end
