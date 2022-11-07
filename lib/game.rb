
require_relative 'display.rb'

class Game
  include Display
  def initialize (player, computer)
    @player = player
    @computer = computer
    puts greeting
    puts
    print prompt
    @player.guess = gets.chomp
    
  end

end

