
class Computer
  attr_accessor :solution, :guess
  
  def initialize
    @solution = []
    @guess = []
    4.times { solution.push(rand(1..6)) }
  end

  def guess_rand
    4.times { guess.push(rand(1..6)) }
    guess
  end
end
