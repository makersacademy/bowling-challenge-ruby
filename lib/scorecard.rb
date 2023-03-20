class Scorecard
  def initialize
    @frame_scores = []
    @bonus_scores = 0
    @frame_count = 0
    @count = 0
    @third_ball_in_tenth_frame = 0 #bonus for the 10th frame
  end 

  def total_scores
    bonus_points
    scores = @frame_scores.flatten
    return scores.sum + @bonus_scores + @third_ball_in_tenth_frame
  end 

  def frame(first_roll, second_roll)
    if @frame_count < 10   
      @frame_scores << [first_roll, second_roll]
      @frame_count += 1  
    else 
      @third_ball_in_tenth_frame += first_roll 
    end 
  end 

  def bonus_points
    while @count < 8  # counts bonus for frames 1 to 8
      if @frame_scores[@count][0] == 10 && @frame_scores[@count + 1][0] == 10 && @frame_scores[@count + 2][0] == 10 
        @bonus_scores += 20 
      elsif @frame_scores[@count][0] == 10 && @frame_scores[@count + 1][0] == 10
        @bonus_scores += (10 + @frame_scores[@count + 2][0])
      elsif @frame_scores[@count][0] == 10
        @bonus_scores += (@frame_scores[@count + 1][0] + @frame_scores[@count + 1][1])
      elsif single_frame_score == 10 
        @bonus_scores += @frame_scores[@count + 1][0]
      end 
      @count += 1 
    end 

    if @count == 8   # counts bonus for the 9th frame 
      if @frame_scores[@count][0] == 10 
        @bonus_scores += (@frame_scores[@count + 1][0] + @frame_scores[@count + 1][1])
      elsif single_frame_score == 10 
        @bonus_scores += @frame_scores[@count + 1][0]
      end 
      @count += 1 
    end 
  end  

  private 

  def single_frame_score
    total = 0
    (@frame_scores[@count]).each  do |x|
      total += x 
    end
    return total  
  end
end 
