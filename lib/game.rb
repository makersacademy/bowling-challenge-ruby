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
      if @score[index] == MAX_POINTS
        result += @score[index] + @score[index + 1] + @score[index + 2]
      elsif @score[index] + @score[index + 1] == MAX_POINTS
        result += @score[index] + @score[index + 1] + @score[index + 2]
      else
        result += @score[index] + @score[index + 1]
      end
      if @score[index] == MAX_POINTS
        index +=1
      else
        index += 2
      end
    end
    result
  end
end
