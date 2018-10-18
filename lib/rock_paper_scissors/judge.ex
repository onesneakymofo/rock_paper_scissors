defmodule RockPaperScissors.Judge do
  alias RockPaperScissors.{Player}

  @winners %{"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}

  def score(players) do
    total = total_choice_count(players)

    players
    |> Enum.map(&tally(&1, total))
  end

  def tally(%Player{choice: choice, score: score} = player, total) do
    %{player | score: score + total[@winners[choice]]}
  end

  def total_choice_count(players) do
    players
    |> Enum.group_by(& &1.choice)
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Enum.into(%{})
  end

  def find_winner(game) do
  end
end
