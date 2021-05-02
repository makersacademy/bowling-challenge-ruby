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
    10.times do 
      if @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i == 10
        total_score += @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i + @rolls[roll_number + 2].to_i
      else
        total_score += @rolls[roll_number].to_i + @rolls[roll_number + 1].to_i
      end
      roll_number += 2
    end
    total_score
  end

end