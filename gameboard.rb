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

  def check_for_series(current_letter, series_status, player)
    series_status && current_letter.eql?(player)
  end

  # rubocop doesn't like this method, HOWEVER I am going to leave it, because:
  # - there doesn't seem to be a cleaner way to check for wins in 3 directions
  #   and only loop through a 2D array one time - this keeps time complexity low
  #   which in my opinion is most important
  # - and I think it is still readable even if slightly over the limit
  def check_win(player)
    row_check = true
    count = 0
    # first and last elements of accumulator are for tracking diagonals
    @board_as_array.each_with_object(Array.new(5, true)) do |row, acc|
      row.each_with_index do |letter, i|
        row_check &&= letter.eql?(player)
        # column check (shifted due to diagonal checks in accumulator)
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

  def check_for_draw
    @board_as_array.map { |row| row.include?('+') }.none?(true)
  end

  private

  def print_line
    print "\n---------------\n"
  end
end
