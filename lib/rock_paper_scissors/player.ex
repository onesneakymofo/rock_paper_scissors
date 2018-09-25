defmodule RockPaperScissors.Player do
  defstruct [:name, :score]

  def new(name) do
    %RockPaperScissors.Player{name: name, score: 0}
  end
end
