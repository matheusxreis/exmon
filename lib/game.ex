defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{ computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end,name: __MODULE__)
  end

  def update(state) do
  Agent.update(__MODULE__,fn _ -> update_game_status(state) end)
  end


  def info(), do: Agent.get(__MODULE__, fn it -> it end);
  def player(), do: Map.get(info(), :player)
  def fetch_player(p), do: Map.get(info(), p)
  def turn(), do: Map.get(info(), :turn)


  defp update_game_status(
    %{player: %{life: player_life}, computer: %{life: computer_life}} = state
  ) when player_life == 0 or computer_life == 0, do: Map.put(state, :status, :game_over)

  defp update_game_state(state) do
    state
    |> Map.put(state, :status, :continue)
    |> update_turn()
  end
end
