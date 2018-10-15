#!/bin/ruby

require 'json'
require 'stringio'

# Complete the designerPdfViewer function below.
def designerPdfViewer(h, word)
  asciiArr = []
  word.each_char { |c|
    asciiArr << c.ord - 97
  }
  heightArr = []
  asciiArr.each do |index|
    heightArr << h[index]
  end
  word.size * heightArr.max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

h = gets.rstrip.split(' ').map(&:to_i)

word = gets.to_s.rstrip

result = designerPdfViewer h, word

fptr.write result
fptr.write "\n"

fptr.close()