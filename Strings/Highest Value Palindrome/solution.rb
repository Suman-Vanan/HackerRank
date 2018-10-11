#!/bin/ruby

require 'json'
require 'stringio'

# Complete the highestValuePalindrome function below.
def highestValuePalindrome(s, n, k)

  upperLimit = (s.length/2) - 1
  # this upperLimit excludes the index of the middle character for odd-numbered lengths
  # the middle character gets special treatment (it does not need to have a 'mirror')
  if upperLimit < 0
    upperLimit = 0
  end
  # for strings of length 1, the upperLimit will be -ve.
  # need to set it correctly.  
  
  # string sof length > 1 need to be checked if they can be converted to palindromes within k moves
  # strings of length 1 are already palindromes
  if (s.length != 1)
    minNumChanges = 0; # Minimum no. of changes to return a palindrome
    for i in (0..upperLimit)
      leftChar = s[i]
      rightChar = s[s.length-1-i]

      if leftChar != rightChar
        minNumChanges += 1
      end    
    end

    if minNumChanges > k
      return "-1"
    end
  end
    
  # TODO: handle middle char in odd string
  # If we reach here, it's possible to return a palindome...but how to return the
  # largest palindrome?

  if (s.length == 1 && k >= 1)
    return "9"
  elsif (s.length == 1 && k < 1)
    return "-1"
  end    

  numChanges = 0
  for i in (0..upperLimit)
    leftChar = s[i]
    rightChar = s[s.length-1-i]
    
    if (leftChar != rightChar) && (k - numChanges >= 2)
      s[i] = "9"
      s[s.length-1-i] = "9"
    elsif (leftChar != rightChar) && (k - numChanges == 1)
      if leftChar > rightChar
        s[s.length-1-i] = leftChar
      else
        s[i] = rightChar
      end  
    end
  end  
  s
end

test = File.open("./test.txt")

nk = test.gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

s = test.gets.to_s.rstrip

result = highestValuePalindrome s, n, k

puts result

test.close()
