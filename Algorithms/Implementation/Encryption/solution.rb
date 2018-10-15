#!/bin/ruby
# https://www.hackerrank.com/challenges/encryption/problem

require 'json'
require 'stringio'

# Complete the encryption function below.
def encryption(s)
    
  s = s.gsub(/\s+/, "")
  stringLength = s.length

  sqrtLength = Math.sqrt(stringLength)

  rows = sqrtLength.floor
  columns = sqrtLength.ceil
  
  if rows * columns < stringLength
    rows = rows + 1
  end
        
  grid = Array.new(rows){Array.new(columns)}
  
  charArray = s.split("")

  charArray.each_with_index {|val, index| grid[(index / columns).floor][index % columns] = val}
  # newGrid = my_transpose(grid)
  
  result = ""
  
  for i in (0..columns - 1)
    for j in (0..rows - 1)
      char = grid[j][i]
      if !char.nil?
        result << char
      end  
    end
    result << " "
  end
  
  result

  # grid
end

def my_transpose(matrix)

  new_matrix = []

  i = 0


  while i < matrix.size
    new_matrix[i] = []
    j = 0  # move this here
    while j < matrix.size
      new_matrix[i] << matrix[j][i]
      j += 1
    end
    i += 1
  end

  return new_matrix
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = encryption s

fptr.write result
fptr.write "\n"

fptr.close()
