
require_relative 'board.rb'
require_relative 'computer.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'player.rb'

p = Player.new
c = Game.new(p, "test2")
b = Board.new