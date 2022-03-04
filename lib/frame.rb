 class Frame
   
  def initialize
    @frame =[] 
    @roll_count = 0
  end

  def roll(pins)
    @pins = pins
    @frame << @pins
    if strike? || spare?
      @roll_count = 0 
    else
      @roll_count += 1
    end
    @frame
  end

  def standard?
    @frame.sum < 10
  end

  def complete?
    @roll_count >= 1 || @frame[0] == 10
  end

  def strike?
    @pins == 10
  end

  def spare?
    @frame.sum == 10 && @frame[0] != 10
  end

end
