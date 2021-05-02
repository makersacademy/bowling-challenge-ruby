# frozen_string_literal: true

class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score(roll_index = 0, frame = 1)
    return 0 if frame > 10

    if strike?(roll_index)
      score(roll_index + 1, frame + 1) + 10 + strike_bonus(roll_index)
    elsif spare?(roll_index)
      score(roll_index + 2, frame + 1) + 10 + spare_bonus(roll_index)
    else
      score(roll_index + 2, frame + 1) + sum_of_frame_rolls(roll_index)
    end
  end

  private

  def sum_of_frame_rolls(roll_index)
    roll_at(roll_index) + roll_at(roll_index + 1)
  end

  def spare_bonus(roll_index)
    roll_at(roll_index + 2)
  end

  def strike_bonus(roll_index)
    roll_at(roll_index + 1) + roll_at(roll_index + 2)
  end

  def spare?(roll_index)
    sum_of_frame_rolls(roll_index) == 10
  end

  def strike?(roll_index)
    roll_at(roll_index) == 10
  end

  def roll_at(index)
    @rolls[index] || 0
  end
end
