
class Board
  attr_accessor :progress, :feedback

  def initialize
    @progress = []
    4.times { progress << []}
    @feedback = []
    4.times { feedback << []}
    p @progress
    p @feedback
    full_board
  end

  def full_board

  end

end