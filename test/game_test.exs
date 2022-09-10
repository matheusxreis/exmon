defmodule ExMon.GameTest do
  use ExUnit.Case


  alias ExMon.{Game, Player}

    describe "start/2" do
      test "starts the game state" do
        player = Player.build("Matheus", :punch, :kick, :heal);
        computer = Player.build("Computer", :punch, :kick, :heal)
        # how it doenst matter if the PID is literraly equal, I can do the assert with pattern matching
        # with '==' I need that assert be exactly equal ///  assert Game.start(computer, player) == {:ok, 1212 }

        assert {:ok, _pid } = Game.start(computer, player)
      end
    end

    describe "info/0" do
      test "returns the current game state" do


        player = Player.build("Matheus", :punch, :kick, :heal);
        computer = Player.build("Computer", :punch, :kick, :heal)
        Game.start(computer, player)

        expected_response = %{
          computer: %Player{life: 100, moves: %{move_average: :kick, move_heal: :heal, move_random: :punch}, name: "Computer"},
          player: %Player{life: 100, moves: %{move_average: :kick, move_heal: :heal, move_random: :punch}, name: "Matheus"}, status: :started, turn: :player}

        assert Game.info() == expected_response
      end
    end

    describe "update/1" do
      test "returns the game state updated" do

        player = Player.build("Matheus", :punch, :kick, :heal);
        computer = Player.build("Computer", :punch, :kick, :heal)
        Game.start(computer, player)

        expected_response = %{
          computer: %Player{
            life: 100,
            moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
            name: "Computer"},
          player: %Player{
            life: 100,
            moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
            name: "Matheus"},
            status: :started,
            turn: :player}

        assert Game.info() == expected_response

        new_state = %{
          computer: %Player{
            life: 70,
            moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
            name: "Computer"},
          player: %Player{
            life: 100,
            moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
            name: "Matheus"},
            status: :started,
            turn: :player}

          expected_new_response = %{new_state | status: :continue, turn: :computer}

          Game.update(new_state)

         assert Game.info() == expected_new_response
      end
    end

   describe "player/0" do
    test "returns the current player state in the game" do
      player = Player.build("Matheus", :punch, :kick, :heal);
      computer = Player.build("Computer", :punch, :kick, :heal)
      Game.start(computer, player)

      expected_response = %Player{
        life: 100,
        moves: %{move_average: :kick, move_heal: :heal, move_random: :punch},
        name: "Matheus"
      }

      assert Game.player() == expected_response
    end
   end
end
