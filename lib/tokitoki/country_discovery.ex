defmodule Tokitoki.CountryDiscovery do
  def find(country) do
    try do
      Excountries.Radar.by_name(country)
    catch
      _ -> nil
    end
  end
end
