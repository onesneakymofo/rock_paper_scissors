defmodule RockPaperScissors do
  def new_game() do
    {:ok, pid} = RockPaperScissors.GameSupervisor.start_game()
    pid
  end

  def shoot(game_pid, player, choice) do
    GenServer.call(game_pid, {:shoot, player, choice})
  end

  def join(game_pid, player) do
    GenServer.call(game_pid, {:join, player})
  end
end
