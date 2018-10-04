defmodule RockPaperScissors.Game do
  defstruct players: %{}, winner: nil

  def new() do
    %RockPaperScissors.Game{players: %{}, winner: nil}
  end

  def join(game, player) do
    new_players = Map.put(game.players, Map.count(game.players), player)
    %{game | players: new_players}
  end

  def shoot(game, player, choice) do
    players_choice = %{player | choice: choice}
  end

  def update_scores(game) do
    game |> Judge.tally
  end

  def declare_winner(game) do
    game
      |> Judge.declare_winner
      |> reset_choices
  end

  def reset_choices(game)

  end
end
