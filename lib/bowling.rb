class Bowling 

  def initialize
    @frame = ""
    @roll = ""
    @pins = ""
  end 

  def frames(frame)
    @frame = frame
  end

  def rolls(roll, pins)
    @roll = roll
    @pins = pins
  end 

  def frame_score
    # @pins = pins
  end 

  def report
    return "You just played frame: #{@frame} and roll: #{@roll}. You currently have #{@pins} points"
  end

end 