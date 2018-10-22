#!/bin/ruby

require 'json'
require 'stringio'

# Solution is in O(n) time complexity.

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries)
  
  arr = Array.new(n+1, 0)
  # why create array of size n+1 ?
  
  queries.each do |query|
    startIndex = query[0] - 1
    endIndex = query[1] - 1
    k = query[2]
    
    # increment value at start of sequence
    arr[startIndex] += k
    
    # decrement value at first position after sequence
    arr[endIndex+1] -= k
  end  
  
  tmp = 0
  max = 0
  
  arr.each do |value|
    # step through summing array
    tmp += value
    
    # capture the max value of tmp
    if max < tmp
      max = tmp
    end
  end  
  max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

nm = gets.rstrip.split

n = nm[0].to_i

m = nm[1].to_i

queries = Array.new(m)

m.times do |i|
    queries[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = arrayManipulation n, queries

fptr.write result
fptr.write "\n"

fptr.close()
