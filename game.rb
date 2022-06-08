# frozen_string_literal: true

# Creates a board that tracks positions
class Board
  def initialize
    @board_as_array = Array.new(3) { Array.new(3, '+') }
  end

  def print_line
    print "\n---------------\n"
  end

  def print_board
    print_line
    @board_as_array.map do |row|
      row.map { |square| print "| #{square} |" }
      print_line
    end
    print "\n"
  end

  def write_board(letter, x_pos, y_pos)
    @board_as_array[x_pos][y_pos] = letter
  end

  # get rid of this at the end, but keep now for debugging purposes
  def print_row(pos)
    @board_as_array[pos]
  end
end

board = Board.new
board.print_board
board.write_board('A', 1, 1)
board.print_board