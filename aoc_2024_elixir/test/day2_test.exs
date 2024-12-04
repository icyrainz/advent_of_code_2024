defmodule Aoc2024Day2Test do
  use ExUnit.Case

  defp read_input(day) do
    File.stream!("../input/day#{day}.txt")
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  @tag :day2part1sample
  test "day2part1 sample" do
    input =
      """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """
      |> String.split("\n", trim: true)

    result = input |> Aoc2024Day2.part1()
    assert(result == 2)
  end

  @tag :day2part1
  test "day2part1" do
    input =
      read_input(2)

    result = input |> Aoc2024Day2.part1()
    assert(result == true)
  end

  @tag :day2part2sample
  test "day2part2 sample" do
    input =
      """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """
      |> String.split("\n", trim: true)

    result = input |> Aoc2024Day2.part2()
    assert(result == 4)
  end

  @tag :day2part2
  test "day2part2" do
    input =
      read_input(2)

    result = input |> Aoc2024Day2.part2()
    assert(result == true)
  end
end
