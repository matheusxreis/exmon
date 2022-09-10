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

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)

    computer_move(Game.info())
  end

  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())
  defp handle_status(_status_, move) do
    move
    |> Actions.fetch_moves()
    |> do_move()
  end

  defp computer_move(%{turn: :computer, status: :continue} = state) do

    move = {:ok, Enum.random([ :move_average, :move_heal, :move_random ])}
    do_move(move)
  end
  defp computer_move(_), do: :ok
  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
       move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end
end
