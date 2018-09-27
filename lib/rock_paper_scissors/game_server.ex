defmodule RockPaperScissors.GameServer do
  use GenServer

  alias RockPaperScissors.Game

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, Game.new()}
  end

  def handle_call({:shoot, player, choice}, _from, game) do
    game = Game.shoot(game, player, choice)
    {:reply, game, game}
  end
end
