# frozen_string_literal: true

class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score(roll_index = 0)
    return 0 if roll_index > @rolls.length

    if @rolls[roll_index] == 10
      score(roll_index + 1) + 10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
    elsif @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
      score(roll_index + 2) + 10 + @rolls[roll_index + 2]
    else
      score(roll_index + 2) + @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i
    end
  end
end
