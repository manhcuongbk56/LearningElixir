defmodule Cat do
  def join(a, b, c \\ " fucking ") do
    a <> c <> b
  end
end

IO.puts Cat.join("Hello", "World")

IO.puts Cat.join("Hello", " World", " Fucking ")

# If a function with default values has multiple clauses, it is required to create a function head
#(without an actual body) for declaring default
defmodule ConCat do
  def join(a, b \\ nil, c \\ " ")
  def join(a, b, _c) when is_nil(b) do
    IO.puts "Cause b's default value is nil, so this sentence is printed!!!"
  end
  def join(a, b, c) do
    a <> c <> b
  end
end

IO.puts Concat.join("Hello", "world")      #=> Hello world
IO.puts Concat.join("Hello", "world", "_") #=> Hello_world
IO.puts Concat.join("Hello")               #=> Print sentence

# When using default values, one must be careful to avoid overlapping function definitions.
# Consider the following example

defmodule OverLap do
  def sum(a, b) do # always match
    a + b
  end
  def sum(a, b, c \\ 100) do # never match
    a + b + c
  end
end

# => invoke OverLap.sum with two arguments will always match the first.