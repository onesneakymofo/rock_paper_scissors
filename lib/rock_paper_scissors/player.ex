defmodule RockPaperScissors.Player do
  @enforce_keys [:name]
  defstruct [:name, :choice, :score]

  alias RockPaperScissors.Player

  def new(name) do
    %Player{name: name}
  end
end
