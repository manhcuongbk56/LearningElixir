defmodule Palindrome do
  def longest_palindrome(s) do
    codepoints = String.codepoints(s)
    [head | tail] = codepoints
    longest_palindrome([head], tail)
  end

  def longest_palindrome(left, right) do
    [head_right | tail_right] = right
    longest_now = even_palindrome([], left, right)
    longest_after = longest_palindrome([head_right | left], tail_right)
    if List.length(longest_now) > List.length(longest_after) do
      longest_now
    else
      longest_after
    end
  end

  defp even_palindrome(result, left, right) when left == [] or right == [] do
    result
  end
  defp even_palindrome(result, [head_left|left], [head_right|right]) do
    IO.inspect binding()
    if head_left == head_right do
      tail = result ++ head_right
      even_palindrome([head_left| tail], left, right)
    else
      result
    end
  end

end