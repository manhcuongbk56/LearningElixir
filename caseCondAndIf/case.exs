case (1,2,3) do
  {2,3,4} -> "This clause doesn't match!"
  {1, x, 3} -> "This clause match and bind x to 2"
  _ -> "This clause match any value"
end

# case with pin (^) operator
x = 1

case 10 do
  ^x -> "Won't match"
  _ -> "Always match"
end

#clause in case with guard

case {1, 2, 3} do
  {1, x, 3} when x > 0 -> "Match"
end

#If none of clause match, an error is raised

case :ok do
  :error -> "ahuhuh"
end
# => no case clause matching

# => anonymous function can have multi clause and guard too
f = fn
    x, y when x > 0 -> x + y
    x, y -> x - y
end

IO.puts f.(1, 3)
IO.puts f.(-1, 3)