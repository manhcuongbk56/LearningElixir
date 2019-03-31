defmodule User do
  defstruct name: "John", age: 27
end

%User{}
%User{name: "Emily"}
%User{name: 1223}
# struct provide compile-time guarantees that only the fields defined through defstruct will be allowed to exist
# in a struct

# Struct are bare map underneath with a fix set of fields
# As map, struct store a special field named _struct_ that holds the name of the struct
me = %User{name: "cuong", age: 26}
me._struct_# => User
#None of the protocol implemented for Map are available for structs.

# If default value is not specified => it is null

# You can also enforce that certain keys have to be specified when creating the struct
defmodule Car do
  @enforce_keys [:price]
  defstruct [:name, :model, price: 50000]
end
# event when price have a default value, we still have to give price when creating struct