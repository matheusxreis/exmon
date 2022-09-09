defmodule ExMon do
  alias ExMon.Player
  alias ExMon.Game
  alias ExMon.Game.Status
  alias ExMon.Game.Actions

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

  def make_move(move) do
    move
    |> Actions.fetch_moves()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "move healing"
       move -> Actions.attack(move)
    end
  end
end
