#!/bin/ruby

require 'json'
require 'stringio'

# The strategy is to use a recursive backtracking algorithm.

# Complete the crosswordPuzzle function below.
def crosswordPuzzle(crossword, words)

  words_array = words.split(';')
  # words_array.sort_by! { |word| word.length } # sort in order of ascending word length
  $solved = false
  solve(crossword, words_array)
end

def possibleDirections(board, word)

  result = []
  length = word.length

  for i in (0..9)
    for j in (0..9)

      properSlotH = true
      properSlotV = true

      for k in (0..length-1)
        # Horizontal direction, axis marked as 0
        if j < 10-length+1
          if not ['-', word[k]].include?(board[i][j+k])
            properSlotH = false
          end
        end
        # Vertical direction, axis marked as 1
        if i < 10-length+1
          if not ['-', word[k]].include?(board[i+k][j])
            properSlotV = false
          end
        end
      end
      
      if properSlotH && j< 10-length+1
        result << [i, j, 0]
      end
      if properSlotV && i<10-length+1
        result << [i, j, 1]
      end
    end
  end
  
  result
end

def move(board, word, start_location)
  i = start_location[0]
  j = start_location[1]
  axis = start_location[2]

  length = word.length

  if axis == 0
    for k in (0..length-1)
      board[i][j+k] = word[k]
    end
  else 
    for k in (0..length-1)
      board[i+k][j] = word[k] 
    end
  end 
end

def rollback(board, word, start_location)
  i = start_location[0]
  j = start_location[1]
  axis = start_location[2]

  length = word.length
  
  if axis == 0
    for k in (0..length-1)
      board[i][j+k] = "-"
    end
  else 
    for k in (0..length-1)
      board[i+k][j] = "-"
    end
  end
end  

def solve(board, words)
  $solved
  if words.empty?
    if not $solved
      return board
    end
    $solved = true
    return
  end

  word = words.pop

  possibleDirections(board, word).each do |direction|
    move(board, word, direction)
    solve(board, words)
    rollback(board, word, direction)
  end
  
  # words << word
  board
end
  

test = File.open("./test.txt")

crossword = Array.new(10)

10.times do |i|
    crossword_item = test.gets.to_s.rstrip
    crossword[i] = crossword_item
end

words = test.gets.to_s.rstrip

result = crosswordPuzzle crossword, words

test.close()

puts result
