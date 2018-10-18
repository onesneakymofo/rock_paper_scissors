defmodule RockPaperScissors.Game do
  defstruct players: [], winner: nil

  alias RockPaperScissors.{Player, Judge}

  def new() do
    %RockPaperScissors.Game{players: [], winners: []]}
  end

  def join(game, player) do
    new_players = [player | game.players]
    %{game | players: new_players}
  end

  def shoot(game, player, choice) do
    game
    |> Player.update_choices(player, choice)
    |> update_scores
    |> assign_winner_if_score_reached
    |> reset_if_winner
  end

  def update_scores(game) do
    updated_players = Judge.tally(game.players)
    %{game | players: updated_players}
  end

  def assign_winner_if_score_reached(game) do
    game
    |> Judge.find_winner()
  end

  def reset_if_winner(game) do
    game
  end
end
