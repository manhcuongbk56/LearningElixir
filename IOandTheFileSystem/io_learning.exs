# IO module is the main mechanism in Elixir for reading and writing to standard input/output(:stdio),
# standard error (:stderr), file and other IO devices.

IO.puts("Hello World")

IO.gets("yes or no")
#By default function in IO module read from standard input and write to standard output
# => we can change that by passing
IO.puts(:stderr, "Hello World")