# frozen_string_literal: true

class Frame
  attr_reader :rolls, :frame_score

  def initialize(rolls = [])
    @rolls = rolls.take(3)
    @frame_score = rolls.sum
  end

  def knockdown(pins)
    @rolls << pins
  end

  def strike?
    rolls[0] == 10
  end

  def spare?
    rolls.sum == 10 && rolls.length == 2 && rolls[0] != 10
  end

  def add_bonus_points(bonus)
    @frame_score += bonus
  end
end
