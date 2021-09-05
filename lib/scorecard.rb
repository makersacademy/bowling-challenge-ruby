class Scorecard 

  attr_reader :frames, :last_frame, :current_score, :ninth_frame
  
  def initialize(frames)
    @frames = frames
    @last_frame = false
    @current_score = 0
    @ninth_frame = false
  end 

  def total 
    tally = 0 
    # 10th_frame if @frames.length == 10
    @frames.each_with_index do |frame, index|
      @last_frame = true if frame == @frames.last
      @ninth_frame = true if index == 9
      bonus_for_strike(index) if frame.strike
      bonus_for_spare(index) if frame.spare
      # last or ninth frame edge case
      @current_score += frame.knocked_down_pins[0] + frame.knocked_down_pins[1] unless last_frame || ninth_frame

      @current_score += frame.knocked_down_pins.sum if last_frame
      p @current_score
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
    return bonus_for_double(index) if @frames[index+1].strike
    p "STRIKE"
    return @current_score += @frames[index+1].knocked_down_pins.sum 
  
  end 

  def bonus_for_double(index)
    # bug when on 9th frame need to calculate bonus
    if @frames[index+2].nil?
      return bonus_for_turkey if @frames[index + 1].knocked_down_pins[1] == 10
    else 
      return bonus_for_turkey if @frames[index+2].strike
      p "DOUBLE"
      @current_score += @frames[index+2].knocked_down_pins.sum 
      return @current_score += 10 
    end
  end 

  def bonus_for_turkey
     # bug when on 9th frame need to calculate bonus
    p "TURKEY"
    @current_score += 20 
  end 

end
