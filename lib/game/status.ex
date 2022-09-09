defmodule ExMon.Game.Status do
  alias ExMon.Game
  def print_round_message() do
    IO.puts("\n====== The game started! ====== \n")
    IO.inspect(Game.info()) # for print what is not a string
    IO.puts("----------------------------------------")
  end
end
