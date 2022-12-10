class Frame 

  def initialize(roll_one, roll_two)
    @roll_one = roll_one
    @roll_two = roll_two
  end 

  def frame_total

    return @roll_one + @roll_two
  end 

  def is_strike?
    if @roll_one == 10 then return true 
    else return false
    end 
  end 

  def is_spare?
    if @roll_one + @roll_two == 10 then return true 
    else return false
    end 
  end 
end 