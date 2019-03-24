# Group several function into modules
# To create module => user defmodule macro

defmodule Cuong do
  def print(a, b) do
    IO.puts "a = #{a}, b = #{b}\n"
  end
end
#Safe module file in .ex file, can be compile use command
# elixirc file_name.ex
# => Next time iex => already have Cuong.print/2 function

#Project structure: Elixir project usually contain three directories
# ebin - contains the compiled code
# lib - contains elixir code (usually .ex files)
# test - contains tests (usually in .exs files)