class Scorecard

  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    10.times do
      if @rolls[roll_index] + @rolls[roll_index + 1] == 10
        result += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
      else
        result += @rolls[roll_index] + @rolls[roll_index + 1]
      end
      roll_index +=2
    end
    result 
  end

end
