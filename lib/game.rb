
require_relative 'display.rb'

class Game
  attr_accessor :player, :computer, :board

  include Display
  def initialize
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
  end

  def play_game
    keep_going = true
    round_number = 0
    while keep_going
      play_round
      round_number += 1
      if round_number == 12
        keep_going = false
      end
    end
    puts "you lose"
  end

  def play_round
    temp_solution = computer.solution.dup
    puts greeting
    puts
    print prompt
    feedback_array = compare_guess(play, temp_solution)
    board.line.push(feedback_array)
    board.full_board.push(board.line)
    board.line = []
    p board.line
    p board.progress
    p board.full_board
    board.view_board
    p computer.solution
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
    guess_array = board.progress.dup
    board.line.push(guess_array)
    p board.line
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
    feedback_array.push(right_place(guess, answer))
    feedback_array.push(right_number(guess, answer))
    p feedback_array.flatten
  end

  def right_place(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index {|index|
      if guess_array[index] == answer_array[index]
        puts "right"
        feedback_array.push("+")
        answer_array[index] = 0
        guess_array[index] = nil
        p feedback_array
      end
      p index
      p answer_array[index]
}
    feedback_array
  end

  def right_number(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index { |index|
      if answer_array.include?(guess_array[index])
      puts "yes include"
      index_to_delete = answer_array.index { |i| i == guess_array[index]}
      answer_array[index_to_delete] = 0
      feedback_array.push("-")
      end
      p index
      }
    feedback_array
  end
end