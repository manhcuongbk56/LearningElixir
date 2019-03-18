# Cond like case but not pattern match, each clause is a boolean

cond do
  2 + 2 == 5 -> "This can not be true"
  2 + 10 == 12 -> "This is true"
end
# If none of the conditions is true => An error is raised.
# => should add final condition which always be true to avoid raising error
cond do
  1 > 2 -> "WTF"
  "MC" -> "AHIHI"
  true -> "Last"
end


# do end block => always bound to outer most function

is_number if true do 1 + 1
end
# => Error: undefined is_number/2
# => The same as:
is_number (if true) do 1 + 1 end

# => need to use ()
is_number(if true do 1+ 1 end)