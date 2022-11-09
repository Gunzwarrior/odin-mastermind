
require_relative 'display.rb'

class Game
  attr_accessor :player, :computer, :board

  include Display
  def initialize
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
    puts greeting
    puts
    print prompt
    play
  end

  def play
    player.guess = gets.chomp
    board.progress = player.guess.split('')
    board.progress = guess_to_integer(board.progress)
    validity_checker(board.progress)
  end

  def guess_to_integer(entry)
    entry.map! {|try| try.to_i}
  end

  def validity_checker(entry)
    if entry.length != 4
      puts error
    elsif wrong_character(entry)
       puts error
    else
      p entry
    end
  end

  def wrong_character(entry)
    entry.each { |element|
    if element == 0 && element > 6 
      return false
    end }
  end

end

