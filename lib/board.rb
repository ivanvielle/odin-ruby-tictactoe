class Board
  # variables for Board class
  attr_accessor :board

  def initialize
    @board = create_board

    
    puts "---GAME BOARD CREATED---"
    display_board
  end

  def update_board(player, coordinates)
    i = coordinates[0]
    j = coordinates[1]
    player_symbol = player.get_symbol

    board[i][j] = player_symbol

    display_board
  end

  protected

  def display_board
    puts "\r"
    puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
    puts "\r"
  end

  # Method to create the game board with 3 arrays each with 3 elements
  # To make up a 3x3 game board
  def create_board
    return Array.new(3) { Array.new(3, "_") }
  end
end