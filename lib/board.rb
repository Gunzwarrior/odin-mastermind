
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
    puts "#{index + 1}. #{full_board[index][0]} | #{full_board[index][1]}" }
  end

end