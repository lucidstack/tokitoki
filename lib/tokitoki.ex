defmodule Tokitoki do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    greetings_csv_path = :tokitoki
    |> :code.priv_dir
    |> Path.join("all.csv")

    children = [
      worker(Tokitoki.GreetingsRepo, [greetings_csv_path]),
      worker(Tokitoki.DayLock, []),
      worker(Tokitoki.Robot, [])
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
