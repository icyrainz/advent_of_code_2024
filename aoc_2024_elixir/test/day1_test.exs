defmodule Aoc2024Day1Test do
  use ExUnit.Case

  defp read_input(day) do
    File.stream!("../input/day#{day}.txt")
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  @tag :day1part1sample
  test "day1part1 sample" do
    input =
      """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """
      |> String.split("\n", trim: true)

    result = input |> Aoc2024Day1.part1()
    assert(result == 11)
  end

  @tag :day1part1
  test "day1part1" do
    input =
      read_input(1)

    result = input |> Aoc2024Day1.part1()
    assert(result == true)
  end

  @tag :day1part2sample
  test "day1part2 sample" do
    input =
      """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """
      |> String.split("\n", trim: true)

    result = input |> Aoc2024Day1.part2()
    assert(result == 31)
  end

  @tag :day1part2
  test "day1part2" do
    input =
      read_input(1)

    result = input |> Aoc2024Day1.part2()
    assert(result == true)
  end
end
