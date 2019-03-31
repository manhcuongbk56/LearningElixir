# Elixir's processes is not OS processes => Very lightweight in term of memory and CPU
# It's not uncommon to have tens or even hundreds of thousands of processes running simultaneously

#basic mechanism for spawning a process is the auto-imported spawn/1
spawn fn -> 1 + 2 end
spawn fn x -> 1 + x end # => error

self() # => PID of current process

# send/2 receive/1 => send message to process and receive message

send self(), {:ahihi, "ok baby"}
receive do
  {:ahihi, msg} -> IO.puts("Receive message: \"#{msg}\" ")
end

# When a message is sent to process, the message is stored on process mail box

# If there is no message in the mailbox matching any of the patterns, the current process will wait until
# a matching message arrives. A timeout can be specified:
receive do
  {:hello, msg} -> msg
  after #single clause
    1_000 -> "Nothing after 1s"
end

#Put it all together
parent = self()
spawn fn ->
  send(parent, {:hello, self()})
end
receive do
  {:hello, pid} -> "Got hello from #{inspect pid}}"
end

# The helper flush/0:
send self(), :hello
send self(), :hi
send self(), :bye
flush() # => flush and print all message in the mailbox