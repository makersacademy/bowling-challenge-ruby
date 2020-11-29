# frozen_string_literal: true

class Game
  MAX_ROLLS = 22
  def initialize
    @score = []
  end

  def roll(pins)
    @score << pins
  end

  def score
    result = 0
    index = 0
    10.times do
      if strike?(index)
        result += strike_score(index)
        index += 1
      elsif spare?(index)
        result += spare_score(index)
        index += 2
      else
        result += frame_score(index)
        index += 2
      end
    end
    result
  end

  private

  def strike?(index)
    @score[index] == 10
  end

  def spare?(index)
    @score[index] + @score[index + 1] == 10
  end

  def strike_score(index)
    10 + @score[index + 1] + @score[index + 2]
  end

  def spare_score(index)
    @score[index] + @score[index + 1] + @score[index + 2]
  end

  def frame_score(index)
    @score[index] + @score[index + 1]
  end
end
