class Scorecard 

  attr_reader :frames, :last_frame, :current_score
  
  def initialize(frames)
    @frames = frames
    @last_frame = false
    @current_score = 0
  end 

  def total 
    tally = 0 
    @frames.each_with_index do |frame, index|
      @last_frame = true if frame == @frames.last
      bonus_for_strike(frame, index) if frame.strike
      bonus_for_spare(frame, index) if frame.spare
      @current_score += frame.knocked_down_pins.sum
    end
  last_frame = false
  @current_score
  end 

  def bonus_for_spare(frame, index)
    return if @last_frame
    # add next bowl onto @current_score when spare
    @current_score += @frames[index+1].knocked_down_pins[0] 
  end

  def bonus_for_strike(frame, index)
    return if @last_frame
    bonus_for_double(index) if @frames[index+1].strike
    # add sum of next frame onto @current_score when strike
    @current_score += @frames[index+1].knocked_down_pins.sum
  end 

  def bonus_for_double(index)
    return @current_score += 20 if @frames[index+2].nil?
    @current_score += @frames[index+2].knocked_down_pins.sum 
  end 

end

















# This method wasn't needed but was fun to make
# def frame
#   fail "Game is complete no frames remaining" if @frames.length == 10
#   first_bowl = rand(0..10)
#   # case strike 
#   index = ((@frames.length) + 1)
#   return @frames[index] = [10, 0] if first_bowl == 10
#   remaining_pins = 10 - first_bowl
#   second_bowl = rand(0..remaining_pins)
#   # case spare 
#   # case no spare or strike scored
#   @frames[index] = [first_bowl ,second_bowl]

