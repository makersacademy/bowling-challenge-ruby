class Frame 
attr_accessor :frame, :frame_end,  :standard_roll, :is_strike
  def initialize(pin_count1 = 0, pin_count2 = 0)

    @standard_roll = true
    @is_strike = "No"

    @roll_count = 0 
    @frame = [] 
    @frame_end = false
    @frame = [pin_count1, pin_count2]
  end

  def roll(pin)
    if pin == 10
        strike
    else
    @standard_roll = true
    @frame[@roll_count] = pin 
    @roll_count += 1 
    end?
    
   end
   @frame
  end

  def strike
    @is_strike = "Yes"
    @roll_count = 2
    @frame = [10,"-"]
    @frame_end = true
    @standard_roll = false
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