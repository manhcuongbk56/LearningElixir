# Map is a go to data structure: %{}
map = %{:a => 1, :b => 2, "ok" => :bad}

#Map compare to keyword
# Map allow any value as a key
# Map's key do not follow any ordering

#Very useful to pattern matching
# A map matches as long as the keys in the pattern exist in the given map
# Empty map always match
%{} = %{:a => 1, "ok" => 2}

# Match when right have all keys of left
%{:test => a} = %{:test => "test", :ok => "not ok"} # => a = "test"

%{:test => a, :test2 => b, "test" => "ok"} = %{:test => "test", :test2 => "test2", "test" => "bad"} # => not match
%{:test => a, :test2 => b, "test" => "ok"} = %{:test => "test", :test2 => "test2", "test" => "ok"}
# =>  match, a= "test", b = "test2"

#Use module: https://hexdocs.pm/elixir/Map.html to manipulate map

Map.get(map, :a)
Map.put(map, "bad", :ok) # => can update or put new key
%{map | :a => "OLALALA"} # => Update key, require key existed

#When all keys in a map are atoms => can use keyword syntax
keyword_map = %{a: "a", b: 1, c: :c}
#Can access atom key by map.atom_name
keyword_map.a

#Elixir developers typically prefer to user the map.field syntax and pattern matching instead of function in Map module
# cause they lead to assertive style of programming: http://blog.plataformatec.com.br/2014/09/writing-assertive-code-with-elixir/