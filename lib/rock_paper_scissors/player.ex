defmodule RockPaperScissors.Player do
  @enforce_keys [:name, :score]
  defstruct [:name, :choice, :score]

  alias RockPaperScissors.Player

  def new(name) do
    %Player{name: name, score: 0, choice: nil}
  end

  def update_choices(game, player, choice) do
    new_players =
      game.players
      |> Enum.map(&add_choice(&1, player, choice))

    %{game | players: new_players}
  end

  defp add_choice(selected_player, choosing_player, choice) do
    case choosing_player.name == selected_player.name do
      true -> %Player{selected_player | choice: choice}
      false -> selected_player
    end
  end
end
