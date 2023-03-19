class Frame 
 

  def play(first, second) # first and second are both integers
    
    # score accumulator keeps track of rolls 
 
    # if first roll = 10, end frame and mark is_strike? as true
      # score is 10 + the two scores from the following frame
    # else add score to score accumulator 

    # play second roll
      # if sum first and second roll = 10, mark is_spare? as true 
        # score is 10 plus first roll of following frame
      # else add score to score accumulator  

    return first + second
  end

  def is_strike? 
    # marks if strike
  end 

  def is_spare?
    # marks if spare
  end 

end