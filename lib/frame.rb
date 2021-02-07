# frozen_string_literal: true

class Frame
  attr_reader :frame_number, :rolls, :bonus

  def initialize(frame_number)
    @frame_number = frame_number
    @rolls = []
    @bonus = 0
  end

  def add_roll(pins)
    raise 'Frame complete' if frame_over?

    rolls << pins
  end

  def strike?
    rolls[0] == 10
  end 

  def spare?
    rolls.sum == 10 && rolls.count == 2
  end 

  def frame_over?
    strike? || @rolls.length == 2
  end

  def add_bonus(bonus)
    @bonus = bonus 
  end 
end
