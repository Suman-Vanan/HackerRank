#!/bin/ruby

require 'json'
require 'stringio'
require 'active_support'
require 'active_support/core_ext'

# Complete the nonDivisibleSubset function below.
def nonDivisibleSubset(k, s)
  potentialSubsets = []
  for i in 1..s.length do
    subsetArray = s.combination(i).to_a
    subsetArray.each { |x| potentialSubsets << x}
  end
  potentialSubsets.reverse!
  
  for subset in potentialSubsets do
    if validSubset(subset, k)
      return subset.length
    end
  end
  return 0
end

def validSubset(subset, k)
  pairArray = subset.combination(2).to_a
  pairArray.each { |pair| 
    if pair.sum % k == 0
      return false
    end
  }
  return true
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')
txt = open("./test.txt")

nk = txt.gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

S = txt.gets.rstrip.split(' ').map(&:to_i)

result = nonDivisibleSubset k, S

puts result

txt.close()
