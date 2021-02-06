# frozen_string_literal: true

class Game
  attr_reader :score, :frame

  TOTAL_FRAMES = 10
  MAX_POINTS = 10

  def initialize
    @frame = 0
    @score = []
  end

  def roll(pins)
    @score << pins
  end

  def game_score
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
        result += @score[index] + @score[index + 1]
        index += 2
      end
    end
    result
  end

  private

  def strike?(index)
    @score[index] == MAX_POINTS
  end

  def strike(index)
    MAX_POINTS + @score[index + 1] + @score[index + 2]
  end

  def spare?(index)
    @score[index] + @score[index + 1] == MAX_POINTS
  end

  def spare(index)
    @score[index] + @score[index + 1] + @score[index + 2]
  end
end
