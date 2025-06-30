# frozen_string_literal: true

# Dependencies

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'

# Create players

player1 = Player.new
player2 = Player.new
board = Board.new
game = Game.new

game.start_game(player1, player2, board)
