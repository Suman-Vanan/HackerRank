#!/bin/ruby

require 'json'
require 'stringio'

# Complete the highestValuePalindrome function below.
def highestValuePalindrome(s, n, k)
    stringLength = s.length
    upperLimit = (stringLength/2)-1
    if upperLimit < 0
        upperLimit = 0
    end    
    # we don't want -ve values for upper limit
    if stringLength.odd? && s.length > 1
      upperLimit += 1
    end

    numOfChanges = 0
    for i in (0..upperLimit)
      if (stringLength.odd? && i == upperLimit)
        # we have reached the middle of a string of odd-numberred length
        if (k - numOfChanges) >= 1
          s[i] = "9"
          numOfChanges += 1
        end
        next    
      end
      leftChar = s[i]
      rightChar = s[stringLength-1-i]
      
      if (k - numOfChanges) >= 2
          s[i] = "9"
          s[stringLength-1-i] = "9"
          numOfChanges += 1
      else
          if leftChar > rightChar
          s[stringLength-1-i] = s[i]
          else  
          s[i] = s[stringLength-1-i]
          end
          numOfChanges += 1
      end  
      
    end
    if numOfChanges > k
      return "-1"
    else
      return s
    end  
end

test = File.open("./test.txt")

nk = test.gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

s = test.gets.to_s.rstrip

result = highestValuePalindrome s, n, k

puts result

test.close()
