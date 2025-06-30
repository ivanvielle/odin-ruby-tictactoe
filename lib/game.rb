# frozen_string_literal: true

def start_game(player1, _player2, board)
  puts 'GAME START!'

  player_move(player1, board)
end

def player_move(player, board)
  move = []

  puts 'Choose a row: |1 - 3|'
  row = gets.chomp.to_i
  move.push(row - 1)

  puts 'Choose a column: |1 - 3|'
  col = gets.chomp.to_i
  move.push(col - 1)
  board.update_board(player, move)

  # Resets the move array to default value
  []
end
