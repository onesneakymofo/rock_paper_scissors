defmodule RockPaperScissors.Game do
  defstruct players: [], winners: [], status: nil

  alias RockPaperScissors.{Player, Judge}

  def new() do
    %RockPaperScissors.Game{players: [], winners: [], status: "waiting"}
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
  end

  def update_scores(game) do
    updated_players = Judge.score(game.players)
    %{game | players: updated_players}
  end

  def assign_winner_if_score_reached(game) do
    game |> Judge.find_winners()
  end
end
