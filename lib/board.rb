
class Board
  attr_accessor :progress, :feedback, :line, :full_board

  def initialize
    @line = []
    @full_board = [["1234", "++--"], ["165643", "--++"]]
    @progress = []
    4.times { progress << []}
    @feedback = []
    4.times { feedback << []}
    p progress
    p feedback
    view_board
  end

  def view_board
    full_board.each_index { |index| 
    puts "#{index + 1}. #{full_board[index][0]} | #{full_board[index][1]}" }
  end

end