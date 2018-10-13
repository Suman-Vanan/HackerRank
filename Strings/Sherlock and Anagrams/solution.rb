#!/bin/ruby

require 'json'
require 'stringio'

# Complete the sherlockAndAnagrams function below.
def sherlockAndAnagrams(s)
  counts = Hash.new(0)
  s.split(//).each { |char| counts[char] += 1 }

  result = 0

  # all_combinations_array = (1..s.size).flat_map { |n| string_array.combination(n).map(&:join) }.sort
  all_combinations_array = (1..s.length).flat_map { |l| (0..s.length - l).map { |i| s[i, l] } }

  until all_combinations_array.empty?
    sub_string = all_combinations_array.shift
    # TODO: handle all anagrams, not just the 'sub_string.reverse'
    # instead of generating all possible permutations of this substring which is O(n!),
    # let's identify elements in all_combinations_array that contain all the chars in sub_string
    all_combinations_array.each do |potentialAnagram|
      if sub_string.chars.sort == potentialAnagram.chars.sort
        result += 1
      end
    end
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
