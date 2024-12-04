defmodule Aoc2024Day2 do
  defp within_range?(diff), do: diff in 1..3

  defp get_levels(report) do
    report
    |> String.split(~r/\s+/, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def part1(input) do
    input
    |> Stream.map(&get_levels/1)
    |> Stream.map(fn levels ->
      levels
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce({true, true}, fn [first | [second | _]], {asc_acc, desc_acc} ->
        asc_diff = second - first
        desc_diff = first - second

        {
          asc_acc && within_range?(asc_diff),
          desc_acc && within_range?(desc_diff)
        }
      end)
      |> then(fn {asc, desc} -> asc || desc end)
    end)
    |> Enum.count(& &1)
  end

  def part2(input) do
    input
    |> Stream.map(&get_levels/1)
    |> Stream.map(fn levels ->
      # Try removing each number and check if remaining sequence is valid
      levels
      |> Enum.with_index()
      |> Enum.any?(fn {_num, idx} ->
        pairs =
          levels
          |> List.delete_at(idx)
          |> Enum.chunk_every(2, 1, :discard)

        strictly_order?(pairs, true) || strictly_order?(pairs, false)
      end)
    end)
    |> Enum.count(& &1)
  end

  defp strictly_order?(pairs, asc?) do
    pairs
    |> Enum.all?(fn [a, b] ->
      diff = if asc?, do: b - a, else: a - b
      within_range?(diff)
    end)
  end
end
