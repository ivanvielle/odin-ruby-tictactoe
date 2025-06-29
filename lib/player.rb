class Player
  # variables for Player class
  @@num_of_players = 0
  attr_accessor :name, :symbol

  def initialize
    # Break line for Player class initialization then asks for the player's name
    puts "\r\n"
    puts "Enter your name: "
    
    # Player inputs name
    @name = gets.chomp 
    @symbol = assign_symbol

    # Increment number of players
    @@num_of_players += 1

    # Calls protected method/s of the class
    display_symbol
  end

  def get_symbol
    return symbol
  end

  protected

  # Method to assign symbol to players, "X" for player 1, "O" for player 2
  def assign_symbol
    if @@num_of_players == 0
      self.symbol = 'X'
    else 
      self.symbol = 'O'
    end
  end

  # Method to display the symbol assigned to player
  def display_symbol
    puts "#{name}'s symbol is #{symbol}"
    puts "\r"
  end
end