defmodule RockPaperScissors.Game do
  defstruct players: [], winner: nil

  alias RockPaperScissors.{Player}

  def new() do
    %RockPaperScissors.Game{players: [], winner: nil}
  end

  def join(game, player) do
    new_players = [player | game.players]
    %{game | players: new_players}
  end

  def shoot(game, player, choice) do
    game
    |> update_choices(player, choice)
    |> update_scores
    |> assign_winner_if_score_reached
    |> reset_if_winner
  end

  def update_choices(game, player, choice) do
    new_players =
      game.players
      |> Enum.map(&add_choice(&1, player, choice))

    %{game | players: new_players}
  end

  def add_choice(selected_player, choosing_player, choice) do
    case choosing_player.name == selected_player.name do
      true -> %Player{selected_player | choice: choice}
      false -> selected_player
    end
  end

  def update_scores(game) do
    game |> Judge.tally()
  end

  def assign_winner_if_score_reached(game) do
    game
    |> Judge.declare_winner()
  end

  def reset_if_winner(game) do
    game
  end
end
