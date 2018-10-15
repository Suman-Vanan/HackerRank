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
  
  neccessaryChangesArray = Array.new(s.length)
  if (s.length != 1)
    for i in (0..upperLimit)
      leftChar = s[i]
      rightChar = s[s.length-1-i]

      if leftChar != rightChar
        # if either char is not equal to the other, at least one change must be made to get a palindrome
        neccessaryChangesArray[i] = true
        neccessaryChangesArray[s.length-1-i] = false
      else
        # if both chars are equal, there are no neccessary changes needed to make a palindrome
        neccessaryChangesArray[i] = false
        neccessaryChangesArray[s.length-1-i] = false
      end    
    end

    neccessaryChanges = neccessaryChangesArray.count(true) # Minimum no. of changes to return a palindrome

    if neccessaryChanges > k
      return "-1"
    end
  end
    
  # TODO: handle middle char in odd string
  # If we reach here, it's possible to return a palindome...but how to return the
  # largest palindrome?

  # Handling the case: String length is 1
  if (s.length == 1 && k >= 1)
    return "9"
  elsif (s.length == 1 && k < 1)
    return "-1"
  end

  # A change is either neccessary to form a palindome, or optional
  # If a change is optional, then I  will perform it only if:
  # - I have spare k left after accounting for all the neccessary changes needed
  numChangesMadeSoFar = 0
  optionalChangesAvailable = k - neccessaryChanges
  for i in (0..upperLimit)
    leftChar = s[i]
    rightChar = s[s.length-1-i]
    leftNeccessary = neccessaryChangesArray[i]
    rightNeccessary = neccessaryChangesArray[s.length-1-i]
    
    if (leftNeccessary || rightNeccessary)
      if (leftChar != rightChar) && (k - numChangesMadeSoFar >= 2)
        s[i] = "9"
        s[s.length-1-i] = "9"
        numChangesMadeSoFar += 2
      elsif (leftChar != rightChar) && (k - numChangesMadeSoFar == 1)
        if leftChar > rightChar
          s[s.length-1-i] = leftChar
        else
          s[i] = rightChar
        end
        numChangesMadeSoFar += 1
      elsif (k - numChangesMadeSoFar >= 2)
        # both characters are the same
        if leftChar == "9"
          next
        end
        s[i] = "9"
        s[s.length-1-i] = "9"
        numChangesMadeSoFar += 2
      elsif (k - numChangesMadeSoFar == 1)
        s[i] = "9"
        numChangesMadeSoFar += 1
      end
    elsif (numChangesMadeSoFar < optionalChangesAvailable)
      # optional change can be made
      if (leftChar != rightChar) && (k - numChangesMadeSoFar >= 2)
        s[i] = "9"
        s[s.length-1-i] = "9"
        numChangesMadeSoFar += 2
      elsif (leftChar != rightChar) && (k - numChangesMadeSoFar == 1)
        if leftChar > rightChar
          s[s.length-1-i] = leftChar
        else
          s[i] = rightChar
        end
        numChangesMadeSoFar += 1
      elsif (k - numChangesMadeSoFar >= 2)
        # both characters are the same. Either we make an optional change to both, or we ignore.
        # We can't just change one char without the other, else we break the palindrome.
        if leftChar == "9"
          next
        end
        s[i] = "9"
        s[s.length-1-i] = "9"
        numChangesMadeSoFar += 2
      end
    end  
  end
  
  # if the string has an odd-numbered length, handle the middle char
  if (s.length.odd? && numChangesMadeSoFar < k)
    s[s.length/2] = "9"
  end

  s
end

test = File.open("./test.txt")

nk = test.gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

s = test.gets.to_s.rstrip

test.close()

result = highestValuePalindrome s, n, k

fptr = File.open("./my_output.txt", 'w')

fptr.write result
fptr.write "\n"

fptr.close()
