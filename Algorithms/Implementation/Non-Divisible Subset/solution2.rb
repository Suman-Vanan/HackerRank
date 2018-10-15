#!/bin/ruby

require 'json'
require 'stringio'

# Complete the nonDivisibleSubset function below.

# This solution is in O(n)
def nonDivisibleSubset(k, s)
  remainderArray = []
  s.each do |num|
    remainderArray << num % k
  end

  counts = Hash.new 0
  remainderArray.each do |remainder|
    counts[remainder] += 1
  end

  result = s.length

  upperLimit = k / 2
  # Since we are 'pairing' each remainder value with it's partner (that sums up to k),
  # we only iterate until the middle of the set of unique remainder values
  for i in (1..upperLimit)
    if i == k-i 
      # we have reached the midpoint
      # Since the midpoint values have no other values to partner with,
      # can only add one of these values to our largest set
      result -= counts[i]-1
      next
    end
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
  if (numOfZeroRemainder >= 1)
    numOfZeroRemainder -= 1
  end
  result -= numOfZeroRemainder
  result

end

txt = open("./test.txt")

nk = txt.gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

S = txt.gets.rstrip.split(' ').map(&:to_i)

result = nonDivisibleSubset k, S

puts result

txt.close()
