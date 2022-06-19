# frozen_string_literal: true

require_relative './gameboard'

example = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

CHOICES = Array.new(9) { |num| [num / 3, num % 3] }

def get_player(player)
  puts "#{player} please pick a letter. Only a single letter is allowed"
  letter = gets.chomp
  return letter if letter.match?(/[[:alpha:]]/) && letter.length == 1

  get_player(player)
end

def get_selection(player, board, choices)
  puts "#{player} please pick a tile. Only a single digit number is allowed and cannot have already been picked."
  selection = (Integer(gets.chomp) - 1) rescue (return get_selection(player, board, choices))
  return choices[selection] if selection.between?(0, 8) && board[choices[selection][0]][choices[selection][1]].eql?('+')

  get_selection(player, board, choices)
end

player1 = get_player('Player 1')
player2 = get_player('Player 2')

# had to use until statement here to stop player from picking the same letter twice to trick the program
# this wasn't possible with an if statement
until player2 != player1
  puts 'You cannot select the same letter as player 1. Try again.'
  player2 = get_player('player 2')
end

board = Board.new
game_over = false

board.print_board(example)
puts 'Note the positions above. The numbers are how you choose your positions'

until game_over == true
  board.write_board(player1, get_selection('Player 1', board.board_as_array, CHOICES))
  board.print_board
  if board.check_win(player1)
    puts 'Player 1 wins!'
    game_over = true
    break
  end
  board.write_board(player2, get_selection('Player 2', board.board_as_array, CHOICES))
  board.print_board
  if board.check_win(player2)
    puts 'Player 2 wins!'
    game_over = true
  end
end
