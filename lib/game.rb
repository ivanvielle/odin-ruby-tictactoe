# frozen_string_literal: true

class Game
  # variables for Board class
  @@turn = ''
  @@winner = ''

  # Constructor
  def initialize
    puts "\r"
    puts 'GAME START!'
    puts "\r"
  end

  # Start the game
  def start_game(player1, player2, board)
    if @@turn.empty?
      @@turn = player2.get_name
    end

    player_move(player1, board)
  end

  # Move the player takes that takes the player object and the game board
  def player_move(player, board)
    move = []

    puts 'Choose a row: |1 - 3|'
    row = gets.chomp.to_i - 1
    move.push(row)

    puts 'Choose a column: |1 - 3|'
    col = gets.chomp.to_i - 1
    move.push(col)

    board.update_board(player, move)

    check_for_winner(player, board)

    # Resets the move array to default value
    []
  end

  def check_for_winner(player, board)
    name = player.get_name
    board = board.get_board
    player_symbol = player.get_symbol

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

    while i < criteria.length do
      if criteria[i]
        @@winner = name
        end_game
        break
      else        
        i += 1
      end
    end

    if @@winner.empty?
      change_turn(player)
    else
      puts "#{@@winner} wins!"
    end
  end

  # Change player turn
  def change_turn(player)
    @@turn = player

    puts "#{player.get_name}'s turn"
  end

  # End the game
  def end_game
    puts "\r"
    puts 'GAME OVER!'
    puts "\r"
  end
end
