# Creates a board that tracks positions
class Board
  def initialize
    @board_as_array = Array.new(3, Array.new(3, '+'))
  end

  def print_line
    print "\n---------------\n"
  end

  def print_board(board = @board_as_array)
    print_line
    board.map do |row|
      row.map { |square| print "| #{square} |" }
      print_line
    end
    print "\n"
  end
end

board = Board.new
board.print_board
