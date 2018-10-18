defmodule Test do
  def winners do
    %{
      rock: :scissors,
      paper: :rock,
      scissors: :paper
    }
  end

  def shoot({p1, c1}) do
    fn {p2, c2}, acc ->
      cond do
        c1 == c2 ->
          acc

        winners()[c1] == c2 ->
          Map.put(acc, p1, Map.get(acc, p1, 0) + 1)

        true ->
          Map.put(acc, p2, Map.get(acc, p2, 0) + 1)
      end
    end
  end

  def score([]), do: []

  def score([player | others]) do
    score(Enum.reduce(others, %{}, Test.shoot(player)))
  end
end
