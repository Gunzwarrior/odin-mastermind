
class Computer
  attr_accessor :solution
  
  def initialize
    @solution = []
    4.times { solution.push(rand(1..6)) }
    p solution
  end
end
