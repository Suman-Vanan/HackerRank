#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumDistances function below.
def minimumDistances(a)
    
    min_distance_arr = []
    
    unique_values = a.uniq
    unique_values.each do |num| 
        if a.count(num) <= 1
            next
        else
            index_matches = a.each_index.select{|i| a[i] == num} # =>[0, 2, 6]
           min_index_pair = index_matches.combination(2).min_by { |a,b| (a-b).abs }
            min_distance_arr << (min_index_pair.first - min_index_pair.last).abs
        end    
        
    end
    
    if min_distance_arr.length ==  0
        return -1
    else 
        return min_distance_arr.sort.first
    end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

a = gets.rstrip.split(' ').map(&:to_i)

result = minimumDistances a

fptr.write result
fptr.write "\n"

fptr.close()

