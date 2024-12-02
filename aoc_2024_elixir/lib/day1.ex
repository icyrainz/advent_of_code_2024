defmodule Aoc2024Day1 do
  def part1(input) do
    input
    |> Stream.map(fn line ->
      line
      |> String.split(~r/\s+/, trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.to_list()
    |> Enum.zip_with(& &1)
    |> Enum.map(fn list ->
      list |> Enum.sort()
    end)
    |> Enum.zip_with(& &1)
    |> Enum.reduce(0, fn [first | [second | _]], acc ->
      delta = abs(first - second)
      acc + delta
    end)
  end

  def part2(input) do
    input
    |> Enum.reduce({0, %{}, %{}}, fn line, {sum, left_map, right_map} ->
      [first | [second | _]] = line |> String.split(~r/\s+/, trim: true)
      sum = sum + String.to_integer(second) * (left_map |> Map.get(second, 0))
      right_map = right_map |> Map.update(second, 1, &(&1 + 1))
      sum = sum + String.to_integer(first) * (right_map |> Map.get(first, 0))
      left_map = left_map |> Map.update(first, 1, &(&1 + 1))
      {sum, left_map, right_map}
    end)
    |> elem(0)
  end
end
