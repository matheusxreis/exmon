defmodule ExMon.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{ computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end,name: __MODULE__)
  end

  def info(), do: Agent.get(__MODULE__, fn it -> it end);
  def player(), do: Map.get(info(), :player)
  def turn(), do: Map.get(info(), :turn)
end
