defmodule ExMon do
  alias ExMon.Player

  def create_player(n, m1, m2, m3) do
    Player.build(n, m1, m2, m3)
  end

end
