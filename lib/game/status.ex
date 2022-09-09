defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("\n====== The game started! ====== \n")
    IO.inspect(Game.info()) # for print what is not a string
    IO.puts("----------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n====== Invalid move: #{move}. This move doesn't exist. ====== \n")
  end
end
