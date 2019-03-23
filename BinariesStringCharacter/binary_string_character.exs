string = "hełło"
byte_size(string)
String.length(string)
# => different result, cause ł need more than one byte

# use ? to get character's code point
?a
#use String.codepoints(string) => split string
String.codepoints(string)

#Binary
# define binary using <<>>
# can concatenate a null byte <<0>> to the end of string to see its inner bytes
string <> <<0>>

#Each number given to a binary  is meant to represent a byte, so it should up to 255
<<256>> # => <<0>>
# If want to use more than one byte =>
<<290 :: size(16)>> # => <<1, 34>>

# code point
<<97 :: utf8>> #=> "a"

# if size < 8 =>
<<1 :: size(1)>> # => <<1 :: size(1)>>
<<256 :: size(1)>> # => <<0 :: size(1)>>
<<256 :: size(14)>>


#char list : single quotes represent a char list

#convert t