class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total_score = 0
    roll_number = 0
    20.times do 
      total_score += @rolls[roll_number]
      roll_number += 1
    end
    total_score
  end

end