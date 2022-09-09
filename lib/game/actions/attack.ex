defmodule ExMon.Game.Actions.Attack do

  alias ExMon.Game

  @move_average_power 18..25
  @move_random_power 10..35
  def attack_opponent(target, move) do
    damage =
      move
      |> calculate_power()

    target
      |> Game.fetch_player()
      |> Map.get(:life)
      |> calculate_total_life(damage)
      |> update_opponent_life(target)
  end

  defp calculate_power(:move_random), do: Enum.random(@move_random_power)
  defp calculate_power(:move_average), do: Enum.random(@move_average_power)

  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end

end
