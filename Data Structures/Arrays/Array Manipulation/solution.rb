#!/bin/ruby

require 'json'
require 'stringio'

# This is the 'brute-force' solution
# Passes some test cases, but the rest fail because they are terminated due to timeout

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries)
  
  result = Array.new(n, 0)
  queries.each do |query|
    startIndex = query[0] - 1
    endIndex = query[1] - 1
    k = query[2]
    for i in (startIndex..endIndex)
      result[i] += k
    end
  end  
  result.max
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
