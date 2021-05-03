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
    index = 0
    10.times do
      if strike?(index)
        score += strike_score(index)
        index += 1
      elsif spare?(index)
        score += spare_score(index)
        index += 2
      else
        score += frame_score(index)
        index += 2
      end
    end
    score
  end

  private

  def spare?(index)
    @rolls[index] + @rolls[index + 1] == 10
  end

  def spare_score(index)
    @rolls[index] + @rolls[index + 1] + @rolls[index + 2]
  end

  def frame_score(index)
    @rolls[index] + @rolls[index + 1]
  end

  def strike?(index)
    @rolls[index] == 10
  end

  def strike_score(index)
    10 + @rolls[index + 1] + @rolls[index + 2]
  end

end
