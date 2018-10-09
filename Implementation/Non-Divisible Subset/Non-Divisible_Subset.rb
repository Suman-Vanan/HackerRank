#!/bin/ruby

require 'json'
require 'stringio'

# Complete the nonDivisibleSubset function below.
def nonDivisibleSubset(k, s)
  potentialSubsets = []
  for i in 2..s.length do
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

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

S = gets.rstrip.split(' ').map(&:to_i)

result = nonDivisibleSubset k, S

puts result
