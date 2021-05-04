# frozen_string_literal: true

class Bowling
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    roll_number = 0
    10.times do
      if strike?(roll_number)
        total_score += strike_score(roll_number)
        roll_number += 1
      elsif spare?(roll_number)
        total_score += spare_score(roll_number)
        roll_number += 2
      elsif total_score += frame_score(roll_number)
        roll_number += 2
      end
    end
    total_score
  end

  private

  def strike?(roll_number)
    @rolls[roll_number].to_i == 10
  end

  def strike_score(roll_number)
    10 + @rolls[roll_number + 1].to_i + @rolls[roll_number + 2].to_i
  end

  def spare?(roll_number)
    @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i == 10
  end

  def spare_score(roll_number)
    @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i + @rolls[roll_number + 2].to_i
  end

  def frame_score(roll_number)
    @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i
  end
end
