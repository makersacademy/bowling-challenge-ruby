class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    20.times do
      result += @rolls[roll_index]
      roll_index += 1
    end
    result
  end

end
