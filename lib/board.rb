
class Board
  attr_accessor :progress, :win, :line, :full_board

  def initialize
    @line = []
    @full_board = []
    @progress = []
    @win = false
  end

  def view_board
    full_board.each_index { |index| 
    puts "#{index + 1}. #{clean_output(full_board[index][0])} | #{clean_output(full_board[index][1])}" }
  end

  def clean_output(array)
    feedback_string = ''
    array.each { |sign|
    feedback_string += "[#{sign}] " }
    feedback_string
  end

end