defmodule Palindrome do
  @doc """
    Returns longest palindrome substring of input
    ## Examples
      iex> Palindrome.longest_substring_palindrome("cabba")
      "abba"
  """
  def longest_substring_palindrome(s) when not is_binary(s), do: nil
  def longest_substring_palindrome(s) do
    if String.length(s) > 1 do
      [head | tail] = String.codepoints(s)
      to_string(longest_substring_palindrome([head], tail))
    else
      s
    end
  end

  defp longest_substring_palindrome(_, []), do: []
  defp longest_substring_palindrome(left, right) do
    [head_right | tail_right] = right
    even = longest_palindrome_around_center([], left, right)
    odd = longest_palindrome_around_center([head_right], left, tail_right)
    longest_now = if length(even) > length(odd) do
      even
    else
      odd
    end
    #Travel center point from left to right to get longest palindrome of remain characters
    longest_remain = longest_substring_palindrome([head_right | left], tail_right)
    if length(longest_now) > length(longest_remain) do
      longest_now
    else
      longest_remain
    end
  end

  defp longest_palindrome_around_center(temp_result, left, right) when left == [] or right == [] do
    temp_result
  end
  defp longest_palindrome_around_center(temp_result, [head_left|left], [head_right|right]) do
    if head_left == head_right do
      # Append to left and right side of temp_result and continue..
      tail = temp_result ++ [head_right]
      longest_palindrome_around_center([head_left| tail], left, right)
    else
      temp_result
    end
  end

end