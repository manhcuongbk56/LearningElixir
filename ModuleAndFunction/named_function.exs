# In module, we can define function with def/2 and private function with defp/2

defmodule Math do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end



end
IO.puts Math.sum(4, 6)

# Function declaration also support guard and multiple clauses.
defmodule MathTwo do
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

#Function capturing
fun = &MathTwo.zero?/1

is_function(fun)

fun.(0)

# local or imported function like is_function/1, can be captured without the module.
&is_function/1

(&is_function/1).(fun)
# => & is capture syntax.

fun = &(&1 + 1)
sum = &(&1 + &2)
fun2 = &"Good #{&1}"
fun2.("job")
# Can capture a function from module like this
fun_from_module = &List.flatten(&1, &2) # => can capture although arity doesn't match. But call later => erro
wrong_capture = &Math.sum(&1, &2, &3)
wrong_capture.(1, 2, 3) # => error
