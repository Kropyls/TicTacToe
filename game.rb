# frozen_string_literal: true

# Creates a board that tracks positions
class Board
  def initialize
    @board_as_array = Array.new(3) { Array.new(3, '+') }
    @player_wins = 0
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

  def check_for_win_line(player_letter)
    @board_as_array.reduce(Array.new(3, player_letter)) do |acc, row|
      return true if row.all? { |letter| letter == player_letter }

      row.each_with_index.map { |letter, i| letter == acc[i] ? letter : false }
    end.any?(player_letter)
  end
end

board = Board.new
board.print_board
board.write_board('A', 1, 1)
board.print_board
board.write_board('A', 1, 2)
board.print_board
board.write_board('A', 1, 0)
board.print_board
puts board.check_for_win_line('A')
