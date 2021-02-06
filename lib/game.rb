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

  def bowling_game
    result = 0
    index = 0

    TOTAL_FRAMES.times do
      @frame +=1
      if @score[index] + @score[index + 1] == 10
        result += @score[index] + @score[index + 1] + @score[index + 2]
      else
        result += @score[index] + @score[index + 1]
      end
      index += 2
    end
    result
  end
end
