#List
# Immutable => Everything in elixir is immutable

list = [1,2,3,4, true, :test, "test"]

#Head list
IO.puts "Head of list: #{hd(list)}"

#Tail list
IO.puts "Tail of list: #{inspect tl(list)}"