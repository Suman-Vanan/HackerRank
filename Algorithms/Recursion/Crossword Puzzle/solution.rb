#!/bin/ruby

require 'json'
require 'stringio'

# The strategy is to use a recursive backtracking algorithm.

# Complete the crosswordPuzzle function below.
def crosswordPuzzle(crossword, words)

  words_array = words.split(';')
  words_array.sort_by! { |word| word.length } # sort in order of ascending word length

  # Place the biggest word first, then place the smaller words
  # Upon finding a proper slot, place the first letter of the word.
  # Then, place the 2nd letter on all adjacent available cells. 
  # If unable to place a letter, then terminate and return nil as the base case.
  # If able to place all the letters, then return the crossword 2d array with that word placed.
  # Move on to the next word.

  solve(crossword, words_array)
end

def solve(board, words_array)

  solved = false

  if words_array.empty?
    solved = true
    return board
  end

  word = words_array.pop
  possible_locations = get_possible_locations(board, word)

  possible_locations.each do |location|
    move(board, word, location)
		solve(board, words_array)
		revert(board, word, location)
  end
  words_array << word
end

# Write the word on the board at the specified location
def move(board, word, location)
  i = location[0]
  j = location[1]
  axis = location[2]

  if axis == 0
    for k in (0..word.length-1)
      board[i][j+k] = word[k]
    end
  else
    for k in (0..word.length-1)
      board[i+k][j] = word[k]
    end  
  end
end

# revert move
def revert(board, word, location)
  i = location[0]
  j = location[1]
  axis = location[2]

  if axis == 0 # horizontal
		for k in (0..word.length-1)
      board[i][j + k] = '-'
    end  
	else # axis 1 is vertical
		for k in (0..word.length-1)
      board[i + k][j] = '-'
    end  
  end
end    

def get_possible_locations(board, word)
  possible_locations = []
  # horizontal possible locations
  for i in (0..10-1)
    for j in (0..10-word.length)
      good = true
      for k in (0..word.length-1)
        if board[i][j+k] != '-' && board[i][j] != word[k]
          good = false
          break
        end
      end    
      
      if good
        possible_locations << [i, j, 0] 
        # 0 indicates that this is for horitontal axis
      end  
    end
  end

  # vertical possible locations
  for i in (0..10-word.length)
    for j in (0..10-1)
      good = true
      for k in (0..word.length-1)
        if board[i+k][j] != '-' && board[i][j] != word[k]
          good = false
          break
        end
      end    
      
      if good
        possible_locations << [i, j, 1] 
        # 0 indicates that this is for vertical axis
      end  
    end
  end

  possible_locations
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
