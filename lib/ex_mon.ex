defmodule ExMon do
  alias ExMon.Player
  alias ExMon.Game

  def create_player(n, m1, m2, m3) do
    Player.build(n, m1, m2, m3)
  end

  def start_game(player) do
    computer_player = create_player("Vin Diesel", :punch, :kick, :heal)
    Game.start(computer_player, player)
  end
end
