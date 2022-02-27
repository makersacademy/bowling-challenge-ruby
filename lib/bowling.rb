class Bowling

  def initialize
    @rolls = []
  end

  def roll(no_of_pins)
    @rolls << no_of_pins
  end

  def score
    result = 0 
    rollIndex = 0
    10.times do 
      if  @rolls[rollIndex] == 10
        result +=  @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 1
      elsif spare?(rollIndex)
        result += spareScore(rollIndex)
        rollIndex += 2
      else
        result += frameScore(rollIndex)
        rollIndex += 2
      end
    end
    result
  end

  def spare?(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def spareScore(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
  end

  def frameScore(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end

end