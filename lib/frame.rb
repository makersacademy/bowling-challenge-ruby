class Frame 
  def initialize 
    @frame_score = [] # score accumulator keeps track of score
    
  end 


  def roll_one(first_score) # first_score is integer
    fail "you cannot knock down a negative number or more than ten pins in a frame" if first_score < 0 || first_score > 10
    @first_score = first_score 
  
    # if first roll = 10, move to next frame and mark is_strike? as true
      # score to push to @frame_score is 10 + the two scores from the following frame
    
  end

  def roll_two(second_score) # second_score is an integer 
    fail "you cannot knock down a negative number or more than ten pins in a frame" if second_score < 0 || second_score > 10
    fail "sum of roll_one and roll_two cannot exceed 10" if @first_score + second_score > 10

    @frame_score << second_score + @first_score
       
        # score is 10 plus first roll of following frame
      # else add score to score accumulator
  end 

  def final_score
    @frame_score.sum 
    # if sum first and second roll = 10, mark is_spare? as true
  end 

  def is_strike? 
    if @first_score == 10 
      return true 
    else 
      return false 
    end 
    # marks if strike
  end 

  def is_spare?
    if @frame_score.sum == 10 
      return true 
    else 
      return false
    end 
    # marks if spare
  end 

end