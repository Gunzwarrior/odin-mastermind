# frozen_string_literal: true

require_relative 'display'

# Game class representing internal game logic
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
    play_game if player_choice == '1'
    watch_game if player_choice == '2'
  end

  def play_game
    puts greeting
    keep_going = true
    round_number = 0
    while keep_going
      play_round
      round_number += 1
      break if board.win == true

      keep_going = false if round_number == 12
    end
    if board.win
      puts win
    else
      puts lose
      puts "The solution was #{board.clean_output(computer.solution)}"
    end
  end

  def watch_game
    select_solution
    computer.create_possible_array
    keep_going = true
    round_number = 0
    while keep_going
      watch_round
      round_number += 1
      break if board.win == true

      keep_going = false if round_number == 12
    end
    if board.win
      puts win
    else
      puts lose
      puts "The solution was #{board.clean_output(player.solution)}"
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
  end

  def watch_round
    temp_solution = player.solution.dup
    print computer_prompt
    temp_guess = watch.dup
    feedback_array = compare_guess(temp_guess, temp_solution)
    board.line.push(feedback_array)
    board.full_board.push(board.line)
    board.line = []
    board.view_board
    update_possible_array(feedback_array, computer.guess)
    computer.guess = []
  end

  def play
    keep_going = true
    while keep_going
      player.guess = gets.chomp
      board.progress = player.guess.split('')
      board.progress = guess_to_integer(board.progress)
      keep_going = false if validity_checker(board.progress)
    end
    guess_array = board.progress.dup
    board.line.push(guess_array)
    board.progress
  end

  def select_solution
    puts solution_choice
    print simple_prompt
    keep_going = true
    while keep_going
      player.solution = guess_to_integer(gets.chomp.split(''))
      keep_going = false if solution_checker(player.solution)
    end
    player.solution
  end

  def watch
    guess_array = computer.guess_from_solution
    board.line.push(guess_array)
    puts computer.guess.join
    computer.guess
  end

  def guess_to_integer(entry)
    entry.map! do |try|
      if try.to_i.to_s == try
        try.to_i
      else
        7
      end
    end
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
    entry.each { |element| return true if !element.positive? || element > 6 }
    false
  end

  def wrong_solution(entry)
    entry.each { |element| return true if element > 6 || element.zero? }
    false
  end

  def compare_guess(guess, answer)
    feedback_array = []
    feedback_array.push(right_place(guess, answer))
    feedback_array.push(right_number(guess, answer))
    board.win = true if feedback_array.include?(['+', '+', '+', '+'])
    feedback_array.flatten
  end

  def right_place(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index do |index|
      next unless guess_array[index] == answer_array[index]

      feedback_array.push('+')
      answer_array[index] = 0
      guess_array[index] = nil
    end
    feedback_array
  end

  def right_number(guess_array, answer_array)
    feedback_array = []
    guess_array.each_index do |index|
      next unless answer_array.include?(guess_array[index])

      index_to_delete = answer_array.index { |i| i == guess_array[index] }
      answer_array[index_to_delete] = 0
      feedback_array.push('-')
    end
    feedback_array
  end

  def choice_checker(entry)
    unless %w[1 2].include?(entry)
      puts choice_error
      print simple_prompt
      return false
    end
    true
  end

  def feedback_compatible(feedback_array, solution, computer_guess)
    plus = feedback_array.count('+')
    minus = feedback_array.count('-')
    zero = 4 - feedback_array.length
    temp_sol = solution.dup
    sol_plus = 0
    temp_guess = computer_guess.dup
    temp_sol.each_index do |i|
      next unless temp_sol[i] == temp_guess[i]

      sol_plus += 1
      temp_sol[i] = nil
      temp_guess[i] = nil
    end
    temp_sol.compact!
    temp_guess.compact!
    sol_minus = temp_sol.intersection(temp_guess).length
    sol_zero = 4 - sol_plus - sol_minus
    sign_array = [plus, minus, zero]
    sol_sign_array = [sol_plus, sol_minus, sol_zero]
    sign_array == sol_sign_array
  end

  def update_possible_array(feedback_array, computer_guess)
    return if feedback_array == ['+', '+', '+', '+']

    computer.possible_solution.delete_if do |solution|
      if feedback_array == []
        solution.intersect?(computer_guess.uniq)
      else
        !feedback_compatible(feedback_array, solution, computer_guess)
      end
    end
  end
end
