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
      if @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
        result += @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
      else
        result += @rolls[rollIndex] + @rolls[rollIndex + 1]
      end
      rollIndex += 2
    end
    result
  end



end