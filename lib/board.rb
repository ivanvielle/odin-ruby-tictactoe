# frozen_string_literal: true

class Board
  # variables for Board class
  attr_accessor :board

  # Constructor
  def initialize
    @board = []

    create_board

    puts "\r"
    puts '---GAME BOARD CREATED---'
    puts "\r"

    display_board
  end

  # update the board that takes in the move coordinates and player's symbol
  def update_board(player, move)
    # move[0, 1] assigns to variables i for row and j for column
    i = move[0]
    j = move[1]

    # Check if cell is empty
    # If true, place symbol
    self.board[i][j] = cell_empty?(self.board[i][j]) ? player.get_symbol : '-'

    display_board
  end

  def get_board
    board
  end

  # Protected methods
  protected

  # Display the game board
  def display_board
    puts "\r"
    # Loops the board arrays to display the nested elements
    self.board.each do |first, second, third|
      puts "#{first} | #{second} | #{third}"
    end
    puts "\r"
  end

  # Create the game board with 3 arrays each with 3 elements to make up a 3x3 game board
  def create_board
    self.board = Array.new(3) { Array.new(3, '-') }
  end

  # Check if cell is empty
  def cell_empty?(cell)
    cell == '-'
  end
end
