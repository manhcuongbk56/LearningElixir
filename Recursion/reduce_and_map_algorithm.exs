defmodule MathSumList do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)#tail also is a list
  end

  def sum_list([], accumulator) do
    accumulator
  end
end
# => reducing algorithm
IO.puts MathSumList.sum_list([1, 2, 3, 4, 5, 6], 0)

defmodule MathDoubleEach do
  def double_each([head | tail]) do
    [head*2, double_each(tail)]
  end

  def double_each([]) do
    []
  end
end
# => map algorithm
IO.puts inspect MathDoubleEach.double_each([1, 2, 3, 4, 5, 6])

# Notice: recursion and tail call optimization are an important part of Elixir and are commonly used to create loops.
# But we rarely use recursion as above to manipulate lists when programming Elixir.
# Use Enum module
Enum.reduce([1, 2, 3], 0, &(&1 + &2))

Enum.reduce([1, 2, 3], 0, fn(x, acc) -> (IO.puts x
                                          x + acc) end)

Enum.map([1, 2, 3, 4, 5, 6], fn(x) -> x*2 end)
Enum.map([1, 2, 3, 4, 5, 6], &(&1*&1))


