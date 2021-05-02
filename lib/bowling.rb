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

    @rolls.each_slice(2) do |frame|
      if spare?(frame)
        score += 10 + @rolls[roll_index + 2]
      else
        score += frame[0].to_i + frame [1].to_i
      end
      roll_index += 2
    end
    score
  end

  def spare?(frame)
    frame[0].to_i + frame[1].to_i == 10
  end
end
