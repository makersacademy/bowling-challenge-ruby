# frozen_string_literal: true

class BowlingScore
  def initialize
    @score = []
  end

  def roll(pins)
    @score << pins
  end

  def total_score
    total = 0
    index = 0
    10.times do
      if strike?(index)
        total += (@score[index] + @score[index + 1] + @score[index + 2])
        index += 1
      elsif spare?(index, (index + 1))
        total += (@score[index] + @score[index + 1] + @score[index + 2])
        index += 2
      else
        total += @score[index] + @score[index + 1]
        index += 2
      end
    end
    total
  end

  private

  def strike?(index)
    @score[index] == 10
  end

  def spare?(ball_1, ball_2)
    @score[ball_1] + @score[ball_2] == 10
  end
end
