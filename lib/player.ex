# unlike Map type, Struct has to be yours keys defined
defmodule ExMon.Player do

  @enforce_keys [:life, :name, :move_random, :move_average, :move_heal]
  defstruct [:life, :name, :move_random, :move_average, :move_heal]

  def build(name, move_random, move_average, move_heal) do
    %ExMon.Player{
      name: name,
      move_random: move_random,
      move_average: move_average,
      move_heal: move_heal,
      life: 100
    }
  end

end
