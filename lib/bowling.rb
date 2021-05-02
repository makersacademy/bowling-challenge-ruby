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
      total_score += if spare?(roll_number)
                       spare_score(roll_number)
                     else
                       frame_score(roll_number)
                     end
      roll_number += 2
    end
    total_score
  end

  private

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
