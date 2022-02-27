class Bowlinggame
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
   
    score_counter = 0
     rollindex = 0
    # rollIndex - count the number in the array
    10.times do
     score_counter += @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i 
    
    rollindex += 2

      # rolls needs to be bought to 10 as the game needs to frame by frame instead of rolls
      # 10.times and rollIndex needs to be incremented by 2
      # rolls is the number scored by the player
      # 
      # however for a spare the index needs
      # to add the score from the next roll too
    end
  score_counter
  end

  # def spare
  
  # end
end
