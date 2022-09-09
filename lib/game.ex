defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{ computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end,name: __MODULE__)
  end

  def update(state) do
  Agent.update(__MODULE__,fn _ -> state end)
  end


  def info(), do: Agent.get(__MODULE__, fn it -> it end);
  def player(), do: Map.get(info(), :player)
  def fetch_player(p), do: Map.get(info(), p)
  def turn(), do: Map.get(info(), :turn)

end
