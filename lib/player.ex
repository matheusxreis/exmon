# unlike Map type, Struct has to be yours keys defined
defmodule ExMon.Player do

  @required_keys [:life, :move_average, :move_heal, :move_random, :name]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_random, move_average, move_heal) do
    %ExMon.Player{
      life: @max_life,
      move_average: move_average,
      move_heal: move_heal,
      move_random: move_random,
      name: name,
    }
  end

end
