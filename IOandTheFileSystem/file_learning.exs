# By default, file are opened in binary mode, which requires developers to use the specific
# IO.binread/2 and IO.binwrite/2

{:ok, file} = File.open("/home/cuong/ahuhu", [:write]) # file = PID???, full path
{:ok, file} = File.open("ahuhu", [:write]) # file = PID???, current directory
IO.binwrite(file, "cuong")
IO.binwrite(file, "le")
File.close(file)
File.read("/home/cuong/ahuhu")

# Functions in the File module have two variants: one "regular" variant and another variant with a trailing bang(!)
File.read("ahuhu") # => {:ok, "cuongle"}
File.read!("ahuhu") # => "cuongle"
File.read("ahihi") # => {:error, :enoent}
File.read("ahihi") # => Raise an error
# The function with ! return value of file, not a tuple
# If anything goes wrong, the function raises an error.

# Avoid writing
{:ok, content} = File.read("content_file") # => read error => pattern matching fail.

# Own implementing
pid = spawn fn ->
  receive do: (msg -> IO.inspect msg)
end

IO.write(pid, "hello") #after writing done => error