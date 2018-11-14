defmodule RockPaperScissors.Judge do
  alias RockPaperScissors.{Player}

  @winners %{"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}

  def score(players) do
    total = total_choice_count(players)

    players
    |> Enum.map(&tally(&1, total))
  end

  def tally(%Player{choice: choice, score: score} = player, total)
      when choice != nil and map_size(total) > 1 do
    case total[@winners[choice]] != nil do
      true -> %{player | score: score + total[@winners[choice]]}
      false -> player
    end
  end

  def tally(%Player{choice: choice} = player, total)
      when choice == nil or map_size(total) <= 1 do
    player
  end

  def total_choice_count(players) do
    players
    |> Enum.filter(fn player -> player.choice != nil end)
    |> Enum.group_by(& &1.choice)
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Enum.into(%{})
  end

  def find_winners(game) do
    game_winners =
      game.players
      |> Enum.filter(fn player -> player.score > 5 end)

    %{game | winners: game_winners}
  end
end
