# frozen_string_literal: true

class Game
  attr_reader :rolls

  def initialize
    @rolls = []
    @current_roll = 0
    @total_score = 0
  end

  def roll(num)
    @rolls << num
  end

  def score
    total_score  = 0
    current_roll = 0

    while current_roll < @rolls.size - 1 #.size returns the number of elements in the set
      roll      = @rolls[current_roll]
      next_roll = @rolls[current_roll + 1]
      if roll == 10
        total_score += 10 + next_roll + @rolls[current_roll + 2]
        current_roll += 1
      elsif roll + next_roll == 10
        total_score += 10 + @rolls[current_roll + 2]
        current_roll += 2
      else
        total_score += roll + next_roll
        current_roll += 2
      end
    end
    total_score
  end
end
