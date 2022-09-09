defmodule ExMon do
  alias ExMon.Player
  alias ExMon.Game
  alias ExMon.Game.Status

  @computer_name "TheRobotMonster"

  def create_player(n, m1, m2, m3) do
    Player.build(n, m1, m2, m3)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :angel_heal)
    |> Game.start(player)

    Status.print_round_message()
  end
end
