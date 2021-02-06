# frozen_string_literal: true

class Game
  attr_reader :scores, :frame

  TOTAL_FRAMES = 10
  MAX_POINTS = 10

  def initialize
    @frame = 0
    @scores = []
  end

  def roll(pins)
    @scores << pins
  end

  def score
    result = 0
    index = 0

    TOTAL_FRAMES.times do
      @frame +=1
      if strike?(index)
        result += strike(index)
        index +=1
      elsif spare?(index)
        result += spare(index)
        index += 2
      else
        result += @scores[index] + @scores[index + 1]
        index += 2
      end
    end
    result
  end

  private

  def strike?(index)
    @scores[index] == MAX_POINTS
  end

  def strike(index)
    MAX_POINTS + @scores[index + 1] + @scores[index + 2]
  end

  def spare?(index)
    @scores[index] + @scores[index + 1] == MAX_POINTS
  end

  def spare(index)
    @scores[index] + @scores[index + 1] + @scores[index + 2]
  end
end
