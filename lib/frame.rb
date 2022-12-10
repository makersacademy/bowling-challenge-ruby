class Frame 

  def initialize(roll_one, roll_two)
    @roll_one = roll_one
    @roll_two = roll_two
  end 

  def frame_total
    if (@roll_one + @roll_two) > 10 then raise ArgumentError.new("invalid score: more than 10 pins detected")
    else return @roll_one + @roll_two
    end 
    
  end 

  def is_strike?
    if @roll_one == 10 then return true 
    else return false
    end 
  end 

  def is_spare?
    if @roll_one + @roll_two == 10 && @roll_one != 10 then return true 
    else return false
    end 
  end 
end 