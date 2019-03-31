# We can write processes that loop infinitely, maintain state, and send and receive messages. => return state
# Example
defmodule KeyValue do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  def loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
  
end

{:ok, pid} = KeyValue.start_link()
send pid, {:put, "test 1", "superman 1"}
send pid, {:put, "test 2", "superman 2"}
send pid, {:put, "test 3", "superman 3"}
send pid, {:get, "test 1", self()}
send pid, {:get, "test 2", self()}
send pid, {:get, "test 3", self()}
send pid, {:get, "test 4", self()}
flush()
# We can register pid, giving it a name as an atom
Process.register(pid, :test) # => second argument must be atom
send :test, {:get, "test 5", self()}
# Using state to maintain state and name registration are very common patterns in Elixir applications.
# Most of the time, we won't implement these pattern manually
# Example
{:ok, pid} = Agent.start_link(fn -> %{} end)
Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
Agent.update(pid, fn map -> Map.put(map, :hello, :cuong) end)
Agent.get(pid, fn map -> Map.get(map, :hello) end)