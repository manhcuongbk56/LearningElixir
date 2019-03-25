# Elixir provides the concept of enumerables and the Enum module to work with them.
# Two was learned before, Map and Reduce

Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)

#Enum module is the module that developer use frequently
#Range with enumerable
Enum.map(1..3, &(&1*2))
Enum.map(1..10, fn x -> x*2  end)

Enum.reduce(1..10, 0, &+/2)

#Function in enum is polymorphic, they can work with any data type that implements Enumerable protocols.
# https://hexdocs.pm/elixir/Enumerable.html