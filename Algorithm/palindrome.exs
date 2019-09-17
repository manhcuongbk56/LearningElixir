defmodule Palindrome do

  def longest_palindrome(s) when not is_binary(s), do: nil
  def longest_palindrome(s) do
    if String.length(s) < 2 do
      s
    else
      [head | tail] = String.codepoints(s)
      to_string(longest_palindrome([head], tail))
    end
  end

  defp longest_palindrome(_, []), do: []
  defp longest_palindrome(left, right) do
    [head_right | tail_right] = right
    even = palindrome([], left, right)
    odd = palindrome([head_right], left, tail_right)
    longest_now = if length(even) > length(odd) do
      even
    else
      odd
    end
    #Slide from left to right to get longest palindrome of remain characters
    longest_remain = longest_palindrome([head_right | left], tail_right)
    if length(longest_now) > length(longest_remain) do
      longest_now
    else
      longest_remain
    end
  end

  defp palindrome(temp_result, left, right) when left == [] or right == [] do
    temp_result
  end
  defp palindrome(temp_result, [head_left|left], [head_right|right]) do
    if head_left == head_right do
      tail = temp_result ++ [head_right]
      palindrome([head_left| tail], left, right)
    else
      temp_result
    end
  end

end