#!/bin/ruby

require 'json'
require 'stringio'

# Complete the surfaceArea function below.
def surfaceArea(a)
  
  rows = a.size
  columns = a[0].size
  
  area = 2 * rows * columns
  # top and bottom surface area
  
  grid = Array.new(rows+2){Array.new(columns+2)}
  
  for i in (0..rows+1)
    for j in (0..columns+1)
      if (i==0 || j==0 || i==rows+1 || j==columns+1)
        grid[i][j] = 0
      else
        grid[i][j] = a[i-1][j-1]
      end
    end
   end
  
  grid
  
  for i in (1..rows)
    for j in (1..columns)
      area += [0, grid[i][j]-grid[i-1][j]].max;
      area += [0, grid[i][j]-grid[i+1][j]].max;
      area += [0, grid[i][j]-grid[i][j-1]].max;
      area += [0, grid[i][j]-grid[i][j+1]].max;
    end
  end
  
  area

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

HW = gets.rstrip.split

H = HW[0].to_i

W = HW[1].to_i

A = Array.new(H)

H.times do |i|
    A[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = surfaceArea A

fptr.write result
fptr.write "\n"

fptr.close()
