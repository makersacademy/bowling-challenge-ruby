class BowlingGame

def initialize
@rolls = []
end 


  def roll(pins)
    @rolls.push pins
  end



  def score
    result = 0
    rolls_count = 0
    20.times do
        result += @rolls[rolls_count]
        rolls_count =+ 1
  end
  result
end
end
