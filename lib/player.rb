# frozen_string_literal: true

# Player class representing players choices
class Player
  attr_accessor :guess, :solution

  def initialize
    @guess = nil
    @solution = nil
  end
end
