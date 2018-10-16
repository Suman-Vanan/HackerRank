#!/bin/ruby

require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
  
  length = arr.size
  hourglass_sum_arr = []
  # we calculate the hourglassSum from the centre of the hourglass
  for i in (1..length-2) # exclude outer edge for both rows & columns
    for j in (1..length-2)
      sum = 0
      sum += arr[i][j]
      sum += arr[i-1][j-1]
      sum += arr[i-1][j]
      sum += arr[i-1][j+1]
      sum += arr[i+1][j-1]
      sum += arr[i+1][j]
      sum += arr[i+1][j+1]

      hourglass_sum_arr << sum
    end
  end    
  hourglass_sum_arr.max
end

test = File.open("./test.txt")

arr = Array.new(6)

6.times do |i|
    arr[i] = test.gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

puts result

test.close()
