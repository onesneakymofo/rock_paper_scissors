defmodule RockPaperScissors.Roshamboer do
  def shoot(game, player, choice) do
    game
    |> update_game_with_choice(player, choice)
    |> check_for_winner
  end

  def update_game_with_choice(game, player, choice) do
    new_choices = [%{player: player, choice: choice} | game.choices]
    %{game | choices: new_choices}
  end

  def check_for_winner(game) do
  end
end
