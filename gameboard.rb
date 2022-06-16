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

  def check_for_win(player_letter)
    # variables checks for diagonal win - 1 for each diagonal
    diag = [true, true]
    # counts iderations throught loop
    count = 0
    @board_as_array.reduce(Array.new(3, player_letter)) do |acc, row|
      # basically a guard clase for a row being all the player letter
      return true if row.all? { |letter| letter == player_letter }

      # tracks a diagonal win for both directions
      diag[0] = false if row[count] != player_letter
      diag[1] = false if row[-(count + 1)] != player_letter
      count += 1
      # checks for column win
      row.each_with_index.map { |letter, i| letter == acc[i] ? letter : false }
    end.any?(player_letter) || diag.any?(true)
  end

  private

  def print_line
    print "\n---------------\n"
  end
end
