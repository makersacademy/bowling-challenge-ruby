# frozen_string_literal: true

class Game
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
