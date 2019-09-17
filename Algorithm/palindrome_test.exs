ExUnit.start
defmodule PalindromeTest do
  use ExUnit.Case
  doctest Palindrome
  test "return nil if input is not string" do
    assert Palindrome.longest_palindrome(1223) == nil
  end

  test "return empty string" do
    assert Palindrome.longest_palindrome("") == ""
  end

  test "return itself when length is even" do
    assert Palindrome.longest_palindrome("abccba") == "abccba"
  end

  test "return itself when length is odd" do
    assert Palindrome.longest_palindrome("abcdcba") == "abcdcba"
  end

  test "return right odd longest substring" do
    assert Palindrome.longest_palindrome("babad") == "aba"
  end


  test "return right even longest substring" do
    assert Palindrome.longest_palindrome("babbad") == "abba"
  end
end