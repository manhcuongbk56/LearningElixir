# Stream support laze <> eager supported by enum
1..100000 |> Stream.map(&(&1*10)) |> Stream.filter(fn x -> rem(x, 2) == 0 end) |> Enum.sum
# Stream are lazy and composable enumerables
# They are composable because we can pipe many stream operations.

# Instead of generating intermediate lists, streams build a series of computations that are invoked
# only when we pass  the underlying stream to the Enum module.

# Many functions in Stream module accept any enumerable as an argument and return a stream as a result.
# Stream module also provides functions to create stream
# Stream.cycle/1
stream = Stream.cycle([1, 2, 3, 4, 5])
enum =  Enum.take(stream, 50)

# Stream.unfold/2
stream = Stream.unfold("Hello World", &String.next_codepoint/1)
enum = Enum.take(stream, 90) # 90 > length("Hello World") => take all