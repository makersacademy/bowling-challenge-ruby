# frozen_string_literal: true

class Bowling
  attr_reader :turn, :roll, :rolls

  def initialize
    @turn = 1
    @roll = 1
    @rolls = {}
  end

  def input(score)
    if (1..10).include? score
      rolling(score)
    else
      raise 'Not a valid score!'
    end
  end

  def rolling(score)
    case @roll
    when 1
      roll_one(score)
    when 2
      roll_two(score)
    end
    score
  end

  def roll_two(score)
    first_roll = @rolls[@turn]
    if (first_roll[0] + score.to_i) > 10
      raise 'Not a valid score!'
    else
      @rolls[@turn] = [first_roll[0], score]
      @roll = 1
      @turn += 1
    end
  end

  def roll_one(score)
    @rolls[@turn] = [score]
    @roll = 2
  end

  def current_score
    5
  end
end
