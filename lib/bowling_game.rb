class Bowling_game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    result = 0
    #Using roll_count as an index for amount of rolls. i.e roll 1, 2 or 3.  
    roll_count = 0
    20.times do
      result += @rolls[roll_count]
    roll_count += 1
    end
    result
  end
end