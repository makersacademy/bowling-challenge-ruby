class Game

  def initialize
    @rolls = []
  end
 
  def roll(bottles)
    @rolls << bottles
  end

  def score
    score = 0
    index = 0

    10.times do

      if @rolls[index] == 10
        score += @rolls[index] + @rolls[index + 1] + @rolls[index + 2]
        index += 1
      elsif @rolls[index] + @rolls[index + 1] == 10
        score += @rolls[index] + @rolls[index + 1] + @rolls[index + 2]
        index += 2
      else
        score += @rolls[index] + @rolls[index +1]
        index += 2
      end
      
    end

    score
  end

end