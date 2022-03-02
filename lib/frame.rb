 class Frame

  def initialize
    @frame =[] 
    @roll_count = 0
  end

  def roll(pins)
    @pins = pins
    @frame << @pins
    # if strike? 
    #   @roll_count = 0 
    #   return @frame
    # end
    # if spare? 
    #   @roll_count = 0 
    #   return @frame
    # end
    if strike? || spare?
      @roll_count = 0 
    else
      @roll_count += 1
    end
   # p "END"
  #  p @roll_count
    @frame
  end
 
 #

  def standard?
    @frame.sum < 10
  end

  def complete?
   # p "COMPLETE rolls count '#{@roll_count}'"
    @roll_count >= 1
  end

  def strike?
   # p "STRIKE? rolls count '#{@roll_count}'" 
    @pins == 10
  end

  def spare?
  #  p "SPARE? rolls count '#{@roll_count}'" 
    @frame.sum == 10 && @frame[0] !=10
  end

end
