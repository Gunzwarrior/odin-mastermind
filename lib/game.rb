
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
    compare_guess(play, computer.solution)
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
    if entry.length != 4
      puts error
      print prompt
      return false
    elsif wrong_character(entry)
      puts error
      print prompt
      return false
    end
    true
  end

  def wrong_character(entry)
    entry.each { |element|
      if element == 0 or element > 6 
      return true
      end
      }
    false
  end

  def compare_guess(guess, answer)
    feedback_array = []
    temp_array_answer = answer
    temp_array_guess = guess
    guess.each_index {|index|
      if guess[index] == answer[index]
        puts "right"
        feedback_array.push("+")
        temp_array_answer[index] = 0
        temp_array_guess[index] = nil
        p feedback_array
        p temp_array_answer
        p temp_array_guess
      end
      p index
      p answer[index]
}
    guess.each_index { |index|
      if temp_array_answer.include?(temp_array_guess[index])
      puts "yes include"
      index_to_delete = temp_array_answer.index { |i| i == temp_array_guess[index]}
      temp_array_answer[index_to_delete] = 0
      p temp_array_answer
      end
      }
      p guess
      p answer
    if guess == answer
      puts "you win"
    else
      puts "you lose"
    end
  end

end

