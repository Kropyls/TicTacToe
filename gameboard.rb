# frozen_string_literal: true

# Creates a board that tracks positions
class Board
  attr_reader :board_as_array

  def initialize
    @board_as_array = Array.new(3) { Array.new(3, '+') }
  end

  def print_board(board = @board_as_array)
    print_line
    board.map do |row|
      row.map { |square| print "| #{square} |" }
      print_line
    end
    print "\n"
  end

  def write_board(letter, position)
    # postion[0] is y, position[1] is x
    @board_as_array[position[0]][position[1]] = letter
  end

  def check_win(player)
    row_check = true
    count = 0
    # first and last slots of accumulator are for tracking diagonals
    @board_as_array.each_with_object(Array.new(5, true)) do |row, acc|
      row.each_with_index do |letter, i|
        # row check
        row_check &&= letter.eql?(player)
        # column check
        acc[i + 1] &&= letter.eql?(player)
      end
      # "guard clause" for row win
      return true if row_check.eql?(true)

      # diagonal checks
      acc[0] &&= row[count].eql?(player)
      acc[-1] &&= row[-(count + 1)].eql?(player)
      count += 1
      row_check = true
    end.any?(true)
  end

  private

  def print_line
    print "\n---------------\n"
  end
end
