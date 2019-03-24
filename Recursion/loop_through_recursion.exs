defmodule Recursion do


  def print_multiple_times(msg, n) do
    IO.puts msg
    print_multiple_times(msg, n - 1)
  end
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end
end

Recursion.print_multiple_times("Hello all", 10) # 10 lines hello all

