# frozen_string_literal: true

require_relative './gameboard'

def get_player(player)
  puts "#{player} please pick a letter. Only a single letter is allowed"
  letter = gets.chomp
  return letter if letter.match?(/[[:alpha:]]/)

  get_player(player)
end

player_1 = get_player('player 1')
player_2 = get_player('player 2')
# build check for player 2 not equal to player 1

board = Board.new

# until game_over == true do
#  board.write_board(player_1)
# end

board.print_board
board.write_board('A', 0, 2)
board.print_board
board.write_board('A', 1, 1)
board.print_board
board.write_board('A', 2, 0)
board.print_board
puts board.check_for_win('A')
