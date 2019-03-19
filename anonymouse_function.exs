#TEST
#ANONYMOUS FUNCTION
add = fn a , b -> a + b end

IO.puts "Is add a function => #{IO.puts(is_function(add))}"

IO.puts add.(1, 2)

# A (.) between the variable and parentheses is required to invoke an anonymous function
IO.puts add.(10, 12)
#Example while need (.) between the variable and an anonymous function
round = fn a -> a*2 end
IO.puts  "Call anonymous round function on 15.3 => result: #{round.(15.3)}" #30.6
IO.puts  "Call round/1 function on 15.3 => result: #{round(15)}" #15
# => A (.) to distinguish anonymous function from named function


#Anonymous function call another anonymous function
double = fn a -> add.(a, a) end

IO.puts "Call double anonymous function on 2 => #{double.(2)}" #4

# A variable assigned inside a function does not affect surrounding environment.
x = 42
IO.puts "x before: #{x}"
set = fn -> x = 0 end
# Set x to 0 in function set
set.()

IO.puts "x after call set #{x}"