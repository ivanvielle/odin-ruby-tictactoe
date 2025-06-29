def start_game(p1, p2, board)
  puts "GAME START!"

  player_move(p1, board)
end

def player_move(player, board)
  @move = []

  puts "Choose a row: |1 - 3|"
  @row  = gets.chomp.to_i - 1
  @move.push(@row)

  puts "Choose a column: |1 - 3|"
  @col = gets.chomp.to_i - 1
  @move.push(@col)

  board.update_board(player, @move)
end