# We have a list of tuple and the first item of tuple is an atom => keyword list.
list = [{:a, 1}, {:b, 2}, {:c, 3}]

list == [a: 1, b: 2, c: 3] #=> true

#keyword list is a list => can use all operator of list to keyword list
list ++ [c: 3]

# lookup => return first value
new_list = [a: 3, a: 4, c: 5]
new_list[:a] # =>3

# Three character make keyword list important:
# Keys must be atom
# Keys are ordered, as specify by developer
# Keys can be given more than once
#Example, ecto library use these characters of keyword list to write query
query = from w in Weather,
          where: w.day > 2,
          where: w.temp < 20,
          select: w

#passing option to function
if false, do: :this, else: :that
# => do and else are keyword list

#We can pattern matching on keyword list. Since it is a list, it requires number of items and their order to match

#Keyword module to manipulate keyword list: https://hexdocs.pm/elixir/Keyword.html