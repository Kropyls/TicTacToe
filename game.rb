# frozen_string_literal: true

require_relative './gameboard'

def get_player(player)
  puts "#{player} please pick a letter. Only a single letter is allowed"
  letter = gets.chomp
  return letter if letter.match?(/[[:alpha:]]/)

  get_player(player)
end

player1 = get_player('Player 1')
player2 = get_player('Player 2')

until player2 != player1
  puts 'You cannot select the same letter as player 1. Try again.'
  player2 = get_player('player 2')
end

board = Board.new

example = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

board.print_board(example)
puts 'Note the positions above. The numbers are how you choose your positions'

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
