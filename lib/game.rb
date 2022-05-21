class Game

  def initialize
    @rolls = []
  end
 
  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    rollIndex = 0

    10.times do

      if @rolls[rollIndex] == 10
        result += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 1
      elsif @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
        result += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
        rollIndex += 2
      else
        result += @rolls[rollIndex] + @rolls[rollIndex +1]
        rollIndex += 2
      end
      
    end
    
    result
  end

end