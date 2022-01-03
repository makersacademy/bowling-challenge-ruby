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
    @index = 0
    10.times do
      if spare?
        running_score += spare_score
        @index += 2 # move to next frame
      else
        running_score += sum_of_frame
        @index += 2  
      end
    end
    running_score
  end

  private

  def spare?
    @rolls[@index] + @rolls[@index + 1] == 10
  end

  def spare_score
    @rolls[@index] + @rolls[@index + 1] + @rolls[@index + 2]
  end

  def sum_of_frame
    @rolls[@index] + @rolls[@index + 1]
  end
end

