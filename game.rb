# frozen_string_literal: true

require_relative './gameboard'

example = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

$choices = [
  [0, 0],
  [0, 1],
  [0, 2],
  [1, 0],
  [1, 1],
  [1, 2],
  [2, 0],
  [2, 1],
  [2, 2]
]

def get_player(player)
  puts "#{player} please pick a letter. Only a single letter is allowed"
  letter = gets.chomp
  return letter if letter.match?(/[[:alpha:]]/)

  get_player(player)
end

def get_selection(player)
  puts "#{player} please pick a tile. Only a single digit number is allowed and cannot have already been picked."
  selection = Integer(gets.chomp) rescue false
  if selection.between?(1, 9) && !$choices[selection - 1].eql?('picked')
    selection_arr = $choices[selection - 1]
    $choices[selection - 1] = 'picked'
    return selection_arr
  end
  get_selection(player)
end

player1 = get_player('Player 1')
player2 = get_player('Player 2')

# had to use until statement here to stop player from picking the same letter twice to trick the program
# this was possible with an if statement
until player2 != player1
  puts 'You cannot select the same letter as player 1. Try again.'
  player2 = get_player('player 2')
end

board = Board.new
game_over = false

board.print_board(example)
puts 'Note the positions above. The numbers are how you choose your positions'

until game_over == true
  board.write_board(player1, get_selection('Player 1'))
  board.print_board
  board.write_board(player2, get_selection('Player 2'))
  board.print_board
end

board.print_board
board.write_board('A', [0, 2])
board.print_board
board.write_board('A', [1, 1])
board.print_board
board.write_board('A', [2, 0])
board.print_board
puts board.check_for_win('A')
