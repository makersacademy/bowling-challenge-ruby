class Bowling
  def initialize
     @rolls = []
  end

  def roll(pin)
     @rolls.push(pin)
  end

  def score
    total_score = 0
    rolls_index = 0

    20.times do
      total_score = total_score + @rolls[rolls_index]
      rolls_index += 1
    end
     total_score
  end
end
