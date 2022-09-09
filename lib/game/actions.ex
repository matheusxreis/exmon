defmodule ExMon.Game.Actions do
  alias ExMon.Game

  def fetch_moves(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  defp find_move(moves, move) do
    Enum.find_value(
      moves,
      {:error, "The move: #{move} doesn't exist."},
      fn {key, value} -> if value === move, do: { :ok, key} end
      )
  end


end
