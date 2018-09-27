defmodule RockPaperScissors.GameSupervisor do
  use DynamicSupervisor

  alias RockPaperScissors.GameServer

  def start_link() do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_game() do
    child_spec = %{
      id: GameServer,
      start: {GameServer, :start_link, []}
    }

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end
end
