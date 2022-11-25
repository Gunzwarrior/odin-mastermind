# frozen_string_literal: true

# Board class to give feedback to the player
class Board
  attr_accessor :progress, :win, :line, :full_board

  def initialize
    @line = []
    @full_board = []
    @progress = []
    @win = false
  end

  def view_board
    full_board.each_index do |index|
      puts "#{index + 1}. #{clean_output(full_board[index][0])} | #{clean_output(full_board[index][1])}"
    end
  end

  def clean_output(array)
    feedback_string = ''
    array.each do |sign|
      feedback_string += "[#{sign}] "
    end
    feedback_string
  end
end
