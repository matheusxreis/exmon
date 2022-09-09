defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n====== The game started! ====== \n")
    IO.inspect(info) # for print what is not a string
    IO.puts("----------------------------------------")
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n====== It's #{player} turn. ====== \n")
    IO.inspect(info) # for print what is not a string
    IO.puts("----------------------------------------")
  end
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n====== The game is over. ====== \n")
    IO.inspect(info) # for print what is not a string
    IO.puts("----------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n====== Invalid move: #{move}. This move doesn't exist. ====== \n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n====== The player attacked the computer dealing #{damage} damage. ====== \n")
  end
  def print_move_message(:player, :attack, damage) do
    IO.puts("\n====== The computer attacked the player dealing #{damage} damage. ====== \n")
  end
  def print_move_message(:player, :heal, life_points) do
    IO.puts("\n====== The player healing #{life_points} life points. ====== \n")
  end
  def print_move_message(:computer, :heal, life_points) do
    IO.puts("\n====== The computer healing #{life_points} life points. ====== \n")
  end
end
