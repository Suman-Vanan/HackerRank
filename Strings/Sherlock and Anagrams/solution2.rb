#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)
  # this method uses the 'complete graph' theory
  # a complete graph is a simple undirected graph in which every pair of distinct vertices is connected by a unique edge
  substrings_array = (1..s.length).flat_map { |l| (0..s.length - l).map { |i| s[i, l] } }
  counts = Hash.new(0)

  until substrings_array.empty?
    substring = substrings_array.shift
    substring = substring.chars.sort.join # sort in alphabetical order
    counts[substring] += 1
  end

  result = 0

  counts.each do |substring, count|
    result += (count  *  (count-1)) / 2
  end

  result
end

test_input = File.open('test_input.txt')

q = test_input.gets.to_i

q.times do |_q_itr|
  s = test_input.gets.to_s.rstrip

  result = sherlockAndAnagrams s

  puts result
end

test_input.close
