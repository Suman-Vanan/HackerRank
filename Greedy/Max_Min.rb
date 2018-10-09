#!/bin/ruby

require 'json'
require 'stringio'

# Complete the maxMin function below.
def maxMin(k, arr)
  arr.sort!
  subGroupArr = []
  for i in 0..arr.size-k do
    subGroupArr << arr[i, k]
  end
  
  unfairness = []
  for subGroup in subGroupArr do
    unfairness << subGroup.max - subGroup.min
  end
  unfairness.min
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

k = gets.to_i

arr = Array.new(n)

n.times do |i|
    arr_item = gets.to_i
    arr[i] = arr_item
end

result = maxMin k, arr

fptr.write result
fptr.write "\n"

fptr.close()
