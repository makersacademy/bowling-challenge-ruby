class GameRepository
  def initialize
    @rolls = []
  end
  
  def add(roll)
   @rolls << roll
  end
  
  def score_card
    #@rolls.sum
  
    roll_index = 0
    score = 0
     10.times do
     if @rolls[roll_index] + @rolls[roll_index + 1] == 10 #spare
     score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
     roll_index +=2
   
    else score += @rolls[roll_index] + @rolls[roll_index + 1]
  
     roll_index += 2
    end
     end
     score
    end
 end