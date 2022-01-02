# frozen_string_literal: true

class Frame
  attr_reader :score
  attr_accessor :roll1, :roll2

  def initialize
    @score = 0
    @roll1 = 0
    @roll2 = 0
  end

  def score
    @score + @roll1 + @roll2
  end

  def set_roll1(pins)
    @roll1 = pins
  end

  def set_roll2(pins)
    @roll2 = pins
  end

  def strike?
    @roll1 == 10
  end

  def spare?
    @roll1 + @roll2 == 10
  end
end
