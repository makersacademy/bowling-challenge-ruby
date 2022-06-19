class Bowling 

  def initialize
    @frame = ""
    @roll = ""
    @pins = ""
    @pins_array = []
  end 

  def frames(frame)
    @frame = frame
  end

  def rolls(roll, pins)
    @roll = roll
    @pins = pins # not too sure what tp use the variable for 
    @pins_array << pins.to_i
  end 

  def frame_score
    p @pins_array
    @total_pins = @pins_array.sum
  end 

  def report
    return "You just played frame: #{@frame} and roll: #{@roll}. You currently have #{@total_pins} points."
  end

end 