defmodule ExMon.Game.Actions.Heal do
  alias ExMon.Game
  alias ExMon.Game.Status

  @move_heal_power 18..25

  def heal_life(target) do
    target
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life()
    |> set_life(target)
  end

  @spec calculate_total_life(number) :: number
  defp calculate_total_life(life), do: Enum.random(@move_heal_power) + life


  defp set_life(life, target) when life>=100, do: update_player_life(target, 100)
  defp set_life(life, target), do: update_player_life(target, life)


  defp update_player_life(target, life) do
    player =
      Game.fetch_player(target)
      |> Map.put(:life, life)
      |> update_game(target, life)

  end

  defp update_game(target_data, target, life) do
    Game.info()
    |> Map.put(target, target_data)
    |> Game.update()

    Status.print_move_message(target, :heal, life)
  end

end
