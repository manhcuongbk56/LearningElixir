tuple = {:okko, "hello"}

IO.puts inspect tuple

#Accesing tuple element
IO.puts elem(tuple, 1)
# Get size of tuple
IO.puts tuple_size(tuple)

#As always, we can not modify tuple as other value type
# put an element to tuple
IO.puts inspect put_elem(tuple, 1, "ahihi")
IO.puts inspect put_elem(tuple, 0, "asdasdasd")
#but tuple is not changed
IO.puts inspect tuple
