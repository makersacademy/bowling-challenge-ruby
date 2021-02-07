# frozen_string_literal: true

# Frame class
class Frame
  STRIKE = 10
  SPARE = 10

  attr_reader :number
  attr_accessor :roll_one, :roll_two, :score

  def initialize(number)
    @number = number
    @roll_one = nil
    @roll_two = nil
    @score = 0
  end

  def calculate_score
    @score = finished? && !strike? ? roll_one + roll_two : roll_one
  end

  def strike?
    roll_one == STRIKE
  end

  def spare?
    !strike? && roll_one + roll_two == SPARE
  end

  def spare_or_strike?
    spare? || strike?
  end

  def finished?
    strike? || !!roll_two
  end
end
