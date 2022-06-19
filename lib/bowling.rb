class Bowling 

  def initialize
    @frame = ""
    @roll = ""
    @pins = ""
    @pins_array = []
    @current_frame = []
    @score_array = []
  end 

  def frames(frame)
    @frame = frame
  end

  def rolls(roll, pins)
    @roll = roll
    @pins = pins # not too sure what to use the variable for 
    # p pins
    @pins_array << pins.to_i
    @current_frame = @pins_array.last(2)
  end 

  def spare
    @spare =+ 1 
    return "Well Done! You scored a spare!" if @current_frame.sum == 10
  end 

  def strike
    @strike =+ 1 
    return "Well Done, you scored a strike! Your total score will now be calculated after your next frame" if @current_frame[0] == 10
  end 

  def frame_score
    if @spare == 1
      frame_score = @current_frame[0] + 10
    elsif @strike == 1
      strike_frame = @current_frame 
      strike_frame.concat(@current_frame)
      strike_frame << 10
      frame_score = @current_frame.sum
    else 
      frame_score = @current_frame.sum
    end 
    @score_array << frame_score 
  end 

  def total_score
    @total_score = @score_array.sum
    # p @total_score
    return "Your current score is #{@total_score} points"
  end 

  def report
    return "You just played frame: #{@frame} and roll: #{@roll}."
  end
end 
