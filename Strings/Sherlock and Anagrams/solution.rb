#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)
  counts = Hash.new(0)
  s.split(//).each { |char| counts[char] += 1 }

  result = 0
  # # special case: handle single-char anagrammatic pairs
  # counts.each do |char, count|
  #   if count >= 2
  #     result += 1
  #   end
  # end
  
  string_array = s.chars
  # all_combinations_array = (1..s.size).flat_map { |n| string_array.combination(n).map(&:join) }.sort
  all_combinations_array = (1..s.length).flat_map { |l| (0..s.length - l).map { |i| s[i, l] } }
  
  while !(all_combinations_array.empty?) 
    sub_string = all_combinations_array.shift
    result += all_combinations_array.count(sub_string.reverse)
    # TODO: handle all anagrams, not just the 'sub_string.reverse'
  end
  result
end

test_input = File.open("test_input.txt")

q = test_input.gets.to_i

q.times do |q_itr|
    s = test_input.gets.to_s.rstrip

    result = sherlockAndAnagrams s

    puts result
end

test_input.close()
