class Frame 

  def initialize(frame_one, frame_two)
    @frame_one = frame_one
    @frame_two = frame_two
  end 

  def frame_total

    return @frame_one + @frame_two
  end 

  def is_strike?
    if @frame_one == 10 then return true 
    else return false
    end 
  end 
end 