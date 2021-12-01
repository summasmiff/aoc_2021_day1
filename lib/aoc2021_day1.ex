defmodule Aoc2021Day1 do
  @moduledoc """
  Documentation for `Aoc2021Day1`.
  """

  @doc """
  Solve the puzzle given list of numbers: input.txt
  Returns number of instances a list value was greater than the list value previous to it.

  ## Examples
      iex> Aoc2021Day1.increases_count([199, 200, 208, 210, 200, 207, 240, 269, 260, 263])
      7

  """
  def increases_count(list) when is_list(list) do
    {_list_item, count} =
      Enum.reduce(list, {nil, 0}, fn list_item, {previous, count} ->
        count =
          if(list_item > previous && not is_nil(previous)) do
            count + 1
          else
            count
          end

        {list_item, count}
      end)

    count
  end

  @doc """
  Solve the puzzle given input.txt

  ## Examples
  iex> Aoc2021Day1.main("input.txt")
  """

  def main(input) do
    # load input file, parse
    input
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer(&1))
    |> increases_count()
  end
end
