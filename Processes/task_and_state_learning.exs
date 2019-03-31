# Task build on top of spawn function to provide better error prone reports and introspection
Task.start fn  -> raise "oops"  end
# => return {:ok, pid} instead of only pid