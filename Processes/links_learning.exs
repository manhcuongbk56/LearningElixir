# By default all processes in Elixir are isolated from each other.
# Can use spawn_link/1 or Process.link/1 to link between processes
# Often link our processes to supervisors which will detect when a process dies and start a new process
# in its place
# While other languages would requires us to catch/handle exceptions, in Elixir we are actually fine with letting
# processes fail because we expect supervisors to properly restart our systems.
# "Failing fast " is a common philosophy when writing Elixir software.
spawn_link fn -> raise "OOPS" end