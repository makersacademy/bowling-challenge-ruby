class Frame

  attr_reader :roll_1, :roll_2, :roll_3
  attr_accessor :tenth_frame

  MAXIMUM_SCORE = 10
  def initialize
    @roll_1 = nil
    @roll_2 = nil
    @tenth_frame = false
    @roll_3 = nil
  end

  def add_roll(roll)
    fail 'Maximum score of 10 allowed' if roll > MAXIMUM_SCORE
    if @roll_1 == nil
      @roll_1 = roll
    elsif @roll_2 == nil
      fail 'Maximum score of 10 allowed' if @roll_1 + roll > MAXIMUM_SCORE && @tenth_frame == false
      @roll_2 = roll 
    else
      fail "Can't have more than 2 rolls" if @tenth_frame == false
      @roll_3 = roll
    end
  end

  def complete?
    return true if @tenth_frame == true && spare? == true && @roll_3 != nil
    return true if @tenth_frame == true && strike? == true && @roll_2 != nil && @roll_3 != nil
    return true if @roll_1 != nil && @roll_2 != nil && @tenth_frame == false
   
    if @roll_1 == MAXIMUM_SCORE
      if @tenth_frame == false
        return true
      else
        if @roll_3 != nil && @roll_2 != nil
          return true
        end
      end
    end
   return false
  end

  def spare?
    return true if @roll_2 != nil && @roll_1 + @roll_2 == MAXIMUM_SCORE
    return false
  end

  def strike?
    return true if @roll_1 == MAXIMUM_SCORE
    return false
  end
end