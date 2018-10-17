defmodule RockPaperScissors.Player do
  @enforce_keys [:name]
  defstruct [:name, :choice, :score]

  alias RockPaperScissors.Player

  def new(name) do
    %Player{name: name}
  end

  def update_choices(game, player, choice) do
    new_players =
      game.players
      |> Enum.map(&add_choice(&1, player, choice))

    %{game | players: new_players}
  end

  def update_score(player) do
    %Player{player | score: player.score + 1}
  end

  defp add_choice(selected_player, choosing_player, choice) do
    case choosing_player.name == selected_player.name do
      true -> %Player{selected_player | choice: choice}
      false -> selected_player
    end
  end
end
