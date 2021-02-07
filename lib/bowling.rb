class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    rollIndex = 0
    20.times do
      result += @rolls[rollIndex]
      rollIndex += 1
    end
    result 
  end

end
