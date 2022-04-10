# frozen_string_literal: true

require_relative './frame'

# this class is instatiated by the Game class
# whenever it reaches the 10th frame, it 
# inherits from the frame class
class FinalFrame < Frame
  attr_reader :rolls

  def initialize
    @rolls = []
    @bonus = []
  end

  def add_roll(pins)
    if @rolls.count < 2 && !strike?
      @rolls << pins
    else
      add_bonus(pins)
    end
  end

end
