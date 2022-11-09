
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
    keep_going = true
    while keep_going
      player.guess = gets.chomp
      board.progress = player.guess.split('')
      board.progress = guess_to_integer(board.progress)
      if validity_checker(board.progress)
        keep_going = false
      end
    end
    board.progress
  end

  def guess_to_integer(entry)
    entry.map! {|try| try.to_i}
  end

  def validity_checker(entry)
    p entry
    if entry.length != 4
      puts error
      print prompt
      return false
    elsif wrong_character(entry)
      puts error
      print prompt
      return false
    else
      p entry
    end
  end

  def wrong_character(entry)
    entry.each { |element|
      if element == 0 or element > 6 
      return true
      end
      }
    false
  end

end

