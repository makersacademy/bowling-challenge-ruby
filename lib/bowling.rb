# frozen_string_literal: true

class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0
    roll_index = 0
    10.times do
      if strike?(roll_index)
        score += strike_score(roll_index)
        roll_index += 1
      elsif spare?(roll_index)
        score += spare_score(roll_index)
        roll_index += 2
      else
        score += frame_score(roll_index)
        roll_index += 2
      end
    end
    score
  end

  private

  def spare?(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
  end

  def spare_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
  end

  def frame_score(roll_index)
    @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
  end

  def strike?(roll_index)
    @rolls[roll_index].to_i == 10
  end

  def strike_score(roll_index)
    10 + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
  end

end
