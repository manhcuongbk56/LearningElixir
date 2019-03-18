#Use the pin operator when you want to pattern match again an existing variable's value rather
# than rebinding the variable.

a = 2

^a = 3
# => error