class Frame 
attr_accessor :frame, :frame_end
  def initialize(pin_count1 = 0, pin_count2 = 0) 
    @roll_count = 0 
    @frame = [] 
    @frame_end = false
    @frame = [pin_count1, pin_count2]
  end

  def roll(pin)   
    @frame[@roll_count] = pin 
    @roll_count += 1 
    end?
    @frame
  end

  def end? 
    if @roll_count == 2 
      @frame_end = true
      @roll_count = 0
    else 
      @frame_end = false
    end
    @frame_end 
  end

end