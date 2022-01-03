# frozen_string_literal: true

class Game
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    running_score = 0
    index = 0
    10.times do
      if @rolls[index] + @rolls[index + 1] == 10
        running_score += 10 + @rolls[index + 2] # add bonus from next roll to score
        index += 2 # move to next frame
      else
        running_score += @rolls[index] + @rolls[index + 1]
        index += 2  
      end
    end
    running_score
  end
end

