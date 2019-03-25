# All the functions in enum module are eager.
# Many function expect an enumerable and return a list back.

odd? = &(rem(&1, 2) != 0)

Enum.filter(1..10, odd?)

# => when performing multiple operations with Enum, each operation is going to generate an intermediate list until
# we reach the result
total_sum = 1..1000 |> Enum.map(&(&1*4)) |> Enum.filter(&(rem(&1, 3) == 0)) |> Enum.sum

new_list = 1..45 |> Enum.filter(&(rem(&1, 5) == 2)) |> Enum.map(&("Number #{&1}"))

# |> the pipe operator, get result of former operation fill in to first argument of latter operation.