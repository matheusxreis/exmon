defmodule ExMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "returns a player" do
      p = ExMon.create_player(
      "Matheus",
      :punch,
      :kick,
      :heal)

      expected_response = %ExMon.Player{
        life: 100,
        moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
        name: "Matheus"
      }
      assert p == expected_response
    end
  end

  describe "start_game/1" do
   test "when the game started, returns a message" do

    p = ExMon.create_player(
      "Matheus",
      :punch,
      :kick,
      :heal)

    message =
      capture_io(fn ->
        assert ExMon.start_game(p) == :ok
      end)

      # =~ is a Regex, searching for a specific content
    assert message =~ "The game started!"
    assert message =~ "status: :started"
    assert message =~ "turn: :player"

   end
  end

  describe "make_move/1" do
    setup do
      p = ExMon.create_player(
        "Matheus",
        :punch,
        :kick,
        :heal)

        capture_io(fn ->
          ExMon.start_game(p);
        end)

        :ok
    end
    test "when the move is valid, do the move and the computer make a move" do

      message =
        capture_io(fn ->
          assert ExMon.make_move(:kick) == :ok
        end)

      assert message =~ "The player attacked the computer"
      assert message =~ "It's computer turn."
      assert message =~ "It's player turn."
      assert message =~ "status: :continue"

    end
    test "when the move is invalid, do the move and the computer make a move" do

      message =
        capture_io(fn ->
          assert ExMon.make_move(:chute) == :ok
        end)

      assert message =~ "Invalid move: chute. This move doesn't exist."


    end
    
  end

end
