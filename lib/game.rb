
require_relative 'display.rb'

class Game
  attr_accessor :player, :computer, :board

  include Display
  def initialize
    @player = Player.new
    @computer = Computer.new
    @board = Board.new
  end

  def select_mode
    puts choice
    print simple_prompt
    keep_going = true
    while keep_going
      player_choice = gets.chomp
      keep_going = false if choice_checker(player_choice)
    end
    play_game if player_choice == "1"
    watch_game if player_choice == "2"
  end
  
  def play_game
    puts greeting
    keep_going = true
    round_number = 0
    while keep_going
      play_round
      round_number += 1
    if board.win == true
      break
    elsif round_number == 12
        keep_going = false
      end
    end
    if board.win
      puts win
    else
      puts lose
      puts "The solution was #{board.clean_output(computer.solution)}"
    end
  end

  def play_round
    temp_solution = computer.solution.dup
    print prompt
    feedback_array = compare_guess(play, temp_solution)
    board.line.push(feedback_array)
    board.full_board.push(board.line)
    board.line = []
    board.view_board
    #p computer.solution
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
    board.progress
  end

  def watch_game
    puts solution_choice
    print simple_prompt
    keep_going = true
    while keep_going
      player.solution = guess_to_integer(gets.chomp.split(''))
      if solution_checker(player.solution)
        keep_going = false
      end
    end
    p player.solution
        
  end

  def guess_to_integer(entry)
    entry.map! {|try| 
      if try == try.to_i.to_s
        try.to_i
      else
        try = 7
      end}
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

  def solution_checker(entry)
    if entry.length != 4
      puts error
      print simple_prompt
      return false
    elsif wrong_solution(entry)
      puts error
      print simple_prompt
      return false
    end
    true
  end

  def wrong_character(entry)
    entry.each { |element|
      if element > 6 
      return true
      end
      }
    false
  end

  def wrong_solution(entry)
    entry.each { |element|
      if element > 6 || element == 0 
      return true
      end
      }
    false
  end

  def compare_guess(guess, answer)
    feedback_array = []
    feedback_array.push(right_place(guess, answer))
    feedback_array.push(right_number(guess, answer))
    board.win = true if feedback_array.include?(["+", "+", "+", "+"])
    feedback_array.flatten
  end

  def right_place(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index {|index|
      if guess_array[index] == answer_array[index]
        feedback_array.push("+")
        answer_array[index] = 0
        guess_array[index] = nil
      end
}
    feedback_array
  end

  def right_number(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index { |index|
      if answer_array.include?(guess_array[index])
      index_to_delete = answer_array.index { |i| i == guess_array[index]}
      answer_array[index_to_delete] = 0
      feedback_array.push("-")
      end
      }
    feedback_array
  end
end

def choice_checker(entry)
  unless entry == "1" || entry == "2"
    puts choice_error
    print simple_prompt
    return false
  end
  true
end