defmodule Tokitoki.DayLock do
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # Client interface
  ##################
  def lock_today do
    GenServer.call(__MODULE__, :lock_today)
  end

  # GenServer callbacks
  #####################
  def init(:ok) do
    {:ok, nil}
  end

  def handle_call(:lock_today, _from, nil = _no_lock) do
    {:reply, :ok, today}
  end

  def handle_call(:lock_today, _from, current_lock) do
    if same_day?(current_lock, today) do
      {:reply, :already_locked, current_lock}
    else
      {:reply, :ok, today}
    end
  end


  # Private methods
  #################
  defp same_day?(%{day: d1, month: m1, year: y1}, %{day: d2, month: m2, year: y2}) do
    d1 == d2 && m1 == m2 && y1 == y2
  end

  defp today, do: DateTime.utc_now
end
