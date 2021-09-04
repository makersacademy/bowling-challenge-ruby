class Scorecard 

  attr_reader :frames, :last_frame, :current_score
  
  def initialize(frames)
    @frames = frames
    @last_frame = false
    @current_score = 0
  end 

  def total 
    tally = 0 
    # 10th_frame if @frames.length == 10
    @frames.each_with_index do |frame, index|
      @last_frame = true if frame == @frames.last
      bonus_for_strike(index) if frame.strike
      bonus_for_spare(index) if frame.spare
      p @current_score += frame.knocked_down_pins.sum 
    end
  @current_score
  end 

  def bonus_for_spare(index)
    return if @last_frame
    # add next bowl onto @current_score when spare
    @current_score += @frames[index+1].knocked_down_pins[0] 
  end

  def bonus_for_strike(index)
    # no bonus on last throw
    return if @last_frame
    bonus_for_double(index) if @frames[index+1].strike
    # add sum of next frame onto @current_score when strike
    return @current_score += 10 if @frames[index+1].knocked_down_pins.sum  > 10
    p "HERE IS STRIKE METHOD"
    p @current_score += @frames[index+1].knocked_down_pins.sum
  end 

  def bonus_for_double(index)
    # this method is skipped if player is on a strike streak > 2 
    return bonus_for_turkey if  @frames[index+2].nil? || @frames[index+2].strike
    return @current_score += 10 if @frames[index+2].nil?
    p "HERE IS DOUBLE METHOD"
    p @current_score += @frames[index+2].knocked_down_pins.sum 
  end 

  def bonus_for_turkey
    p "TURKEY METHOD"
    p @current_score += 10 
  end 

end
