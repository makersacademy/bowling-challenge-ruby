class Bowling

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
      if @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i == 10
        result += @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i + @rolls[roll_index + 2].to_i
      else
        result += @rolls[roll_index].to_i + @rolls[roll_index + 1].to_i 
      end
      roll_index += 2
    end

    result
  end

end
