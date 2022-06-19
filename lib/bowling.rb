class Bowling 

  def initialize
    @frame = ""
    @roll = ""
    @pins = ""
    @pins_array = []
    @current_frame = []
    @score_array = []
    @spare = []
    @strike = []
  end 

  def frames(frame)
    @frame = frame
  end

  def rolls(roll, pins)
    @roll = roll
    @pins = pins # not too sure what to use the variable for 
    @pins_array << pins.to_i
    @current_frame = @pins_array.last(2)
  end 

  def spare
    @spare << 1 
    return "Well Done! You scored a spare!" if @current_frame.sum == 10
  end 

  def strike
    @strike << 1
    p @strike
    return "Well Done, you scored a strike! Your total score will now be calculated after your next frame" if @current_frame[0] == 10
  end 

  def frame_score
    frame_score = @current_frame.sum
    all_strikes = @strike.sum
    all_spares = @spare.sum

    while all_spares >= 1 
      frame_score = 10 + @current_frame[0] 
      all_spares = - 1
      if all_spares.zero?
        break
      end 
    end 

    while all_strikes >= 1 do 
      strike_frame = @current_frame 
      strike_frame.concat(@current_frame)
      strike_frame << (10 * (all_strikes - 1))
      p strike_frame
      frame_score = @current_frame.sum
      all_strikes = - 1
      if all_strikes.zero?
        break
      end 
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
