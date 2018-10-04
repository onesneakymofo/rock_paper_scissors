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

  def shoot(game, shooter, choice) do
    new_players =
      game.players
      |> Enum.map(&add_choice(&1, shooter, choice))

    %{game | players: new_players}
  end

  def add_choice(player, shooter, choice) do
    case shooter.name == player.name do
      true -> %Player{player | choice: choice}
      false -> player
    end
  end

  def update_scores(game) do
    game |> Judge.tally()
  end

  def declare_winner(game) do
    game
    |> Judge.declare_winner()
    |> reset_choices
  end

  def reset_choices(game) do
  end
end
