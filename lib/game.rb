# frozen_string_literal: true.
class BowlingGame
  attr_reader :rolls
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    count = 0
    10.times do
      if strike?(count)
        total_score += strike_score(count)
        count += 1
      elsif spare?(count)
        total_score += spare_score(count)
        count += 2
      else
        total_score += frame_score(count)
        count += 2
      end
    end
    total_score
  end

  def spare?(count)
    @rolls[count] + @rolls[count + 1] == 10
  end

  def spare_score(count)
    10 + @rolls[count + 2]
  end

  def strike?(count)
    @rolls[count] == 10
  end

  def strike_score(count)
    10 + @rolls[count + 1] + @rolls[count + 2]
  end

  def frame_score(count)
    @rolls[count] + @rolls[count + 1]
  end
end
