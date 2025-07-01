# frozen_string_literal: true

class Game
  # variables for Board class
  @@turn = ''
  @@winner = ''
  @@draw = false

  # Constructor
  def initialize
    puts "\r"
    puts 'GAME START!'
    puts "\r"
  end

  # Start the game
  def start_game(player1, player2, board)
    @@turn = player1

    if @@winner.empty? && !@@draw
      player_move(@@turn, board, player1, player2) while @@winner.empty? && !@@draw
    else
      end_game
    end
  end

  # Move the player takes that takes the player object and the game board
  def player_move(player, board, player1, player2)
    move = []

    puts 'Choose a row: |1 - 3|'
    row = gets.chomp.to_i - 1
    move.push(row)

    puts 'Choose a column: |1 - 3|'
    col = gets.chomp.to_i - 1
    move.push(col)

    board.update_board(player, move)

    check_for_winner(board, player1, player2)

    # Resets the move array to default value
    []
  end

  def check_for_winner(board, player1, player2)
    name = @@turn.get_name
    board = board.get_board
    player_symbol = @@turn.get_symbol

    # horizontal checking
    horizontal_1 = board[0][0] == player_symbol && board[0][1] == player_symbol && board[0][2] == player_symbol
    horizontal_2 = board[1][0] == player_symbol && board[1][1] == player_symbol && board[1][2] == player_symbol
    horizontal_3 = board[2][0] == player_symbol && board[2][1] == player_symbol && board[2][2] == player_symbol

    # vertical checking
    vertical_1 = board[0][0] == player_symbol && board[1][0] == player_symbol && board[2][0] == player_symbol
    vertical_2 = board[0][1] == player_symbol && board[1][1] == player_symbol && board[2][1] == player_symbol
    vertical_3 = board[0][2] == player_symbol && board[1][2] == player_symbol && board[2][2] == player_symbol

    # diagonal checking
    diagonal_1 = board[0][0] == player_symbol && board[1][1] == player_symbol && board[2][2] == player_symbol
    diagonal_2 = board[0][2] == player_symbol && board[1][1] == player_symbol && board[2][0] == player_symbol

    # criteria for winning
    criteria = [
      horizontal_1, horizontal_2, horizontal_3,
      vertical_1, vertical_2, vertical_3,
      diagonal_1, diagonal_2
    ]
    i = 0

    while i < criteria.length
      if criteria[i]
        @@winner = name
        break
      else
        i += 1
      end
    end

    if @@draw
      puts "It's a tie!"
    elsif @@winner.empty?
      change_turn(player1, player2)
    else
      puts "#{@@winner} wins!"
    end
  end

  # Change player turn
  def change_turn(player1, player2)
    @@turn = if @@turn == player1
               player2
             else
               player1
             end

    puts "#{@@turn.get_name}'s turn"
  end

  # End the game
  def end_game
    puts "\r"
    puts 'GAME OVER!'
    puts "\r"

    exit 0
  end
end
