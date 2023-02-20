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
      elsif @rolls[roll_index] +@rolls[roll_index +1] != 10 # frame score accumulation <10
      score += @rolls[roll_index] + @rolls[roll_index + 1] 
      elsif @rolls[roll_index] == 10 # Check Strike- previous  fail appeared to be due to rspec - further tests needed to ensure- bonus score is calculated the bonus feature.
      score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
      roll_index += 1
   end
      roll_index += 2
     end
      score
    end
  end

 
 