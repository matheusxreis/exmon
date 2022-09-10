defmodule ExMonTest do
  use ExUnit.Case

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
   test "a" do
    assert 1+1 == 2
   end
  end

  describe "make_move/1" do
    test "a2" do
      assert 1+1 == 2
    end
  end

end
