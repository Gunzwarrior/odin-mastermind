# frozen_string_literal: true

# Computer class to represent the computer's choices
class Computer
  attr_accessor :solution, :guess, :possible_solution

  def initialize
    @solution = []
    @guess = []
    4.times { solution.push(rand(1..6)) }
    @possible_solution = []
  end

  def guess_from_solution
    possible_solution.sample.each { |i| guess.push(i) }
  end

  def create_possible_array
    answer_array = []
    (1..6).each do |w|
      answer_array[0] = w
      (1..6).each do |x|
        answer_array[1] = x
        (1..6).each do |y|
          answer_array[2] = y
          (1..6).each do |z|
            answer_array[3] = z
            possible_solution.push(answer_array.dup)
          end
        end
      end
    end
  end
end
