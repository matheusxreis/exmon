defmodule ExMon.Player do

  @enforce_keys [:life, :name, :move_random, :move_average, :move_heal]
  defstruct [:life, :name, :move_random, :move_average, :move_heal]

end
