# frozen_string_literal: true

class Player
  # variables for Player class
  @@num_of_players = 0
  attr_accessor :name, :symbol

  # Constructor
  def initialize
    # Break line for Player class initialization then asks for the player's name
    puts "\r\n"
    puts 'Enter your name: '

    # Player inputs name
    @name = gets.chomp
    @symbol = assign_player_symbol

    # Increment number of players
    @@num_of_players += 1

    # Calls protected method/s of the class
    display_symbol
  end

  # Get player name
  def get_name
    name  
  end

  # Get player symbol
  def get_symbol
    symbol
  end

  # Protected methods
  protected

  # Assign symbol to players, "X" for player 1, "O" for player 2
  def assign_player_symbol
    self.symbol = @@num_of_players.zero? ? 'X' : 'O'
  end

  # Display the symbol assigned to player
  def display_symbol
    puts "#{name}'s symbol is #{symbol}"
    puts "\r"
  end
end
