#!/bin/ruby

require 'json'
require 'stringio'

# Complete the nonDivisibleSubset function below.
def nonDivisibleSubset(k, s)
  remainderArray = []
  s.each do |num| 
    remainderArray << num % k
  end  
  remainderArray
  
  counts = Hash.new 0
  remainderArray.each do |remainder|
    counts[remainder] += 1
  end
  
  result = s.length
  
  # counts: {1=>3, 2=>1}
  distinctRemaindersArray = counts.keys # [1, 2]
  upperLimit = k / 2
  for i in (1..upperLimit)
    smallerRemainderCount = counts[i] # when i=1, 3
    largerRemainderCount = counts[k-i] # i=1, 1
    if (smallerRemainderCount == 0 || largerRemainderCount == 0)
      next
    else
      if largerRemainderCount >= smallerRemainderCount
        result -= smallerRemainderCount
      else
        result -= largerRemainderCount
      end
    end
  end
  
  numOfZeroRemainder = counts[0]
  if (numOfZeroRemainder > 1)
    numOfZeroRemainder -= 1
  end
  result -= numOfZeroRemainder
  result
  
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

S = gets.rstrip.split(' ').map(&:to_i)

result = nonDivisibleSubset k, S

fptr.write result
fptr.write "\n"

fptr.close()
