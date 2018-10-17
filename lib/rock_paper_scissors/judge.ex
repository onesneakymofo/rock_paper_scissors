defmodule RockPaperScissors.Judge do
  alias RockPaperScissors.{Player}

  def tally([player, others]) do
    others
    |> Enum.each(&evaluate_choice(player, &1))

    tally(others)
  end

  def tally([]), do: nil

  def evaluate_choice(player1 = %Player{choice: "rock"}, player2 = %Player{choice: "scissors"}) do
  end

  def evaluate_choice(player1 = %Player{choice: "scissors"}, player2 = %Player{choice: "paper"}) do
  end

  def evaluate_choice(player1 = %Player{choice: "paper"}, player2 = %Player{choice: "rock"}) do
  end

  def evaluate_choice(player1 = %Player{choice: "scissors"}, player2 = %Player{choice: "rock"}) do
  end

  def evaluate_choice(player1 = %Player{choice: "paper"}, player2 = %Player{choice: "scissors"}) do
  end

  def evaluate_choice(player1 = %Player{choice: "rock"}, player2 = %Player{choice: "paper"}) do
  end

  def evaluate_choice(player1 = %Player{choice: nil}, player2 = %Player{choice: nil}) do
  end

  def find_winner(game) do
  end
end
