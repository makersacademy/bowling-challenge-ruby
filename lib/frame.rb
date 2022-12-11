class Frame 

  attr_reader :roll_one, :roll_two

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

  def bonus_status
    is_spare? || is_strike?
  end 

  def frame_to_hash

   frame_hash = {
      roll_one: roll_one,
      roll_two: roll_two,
      frame_total: frame_total,
      is_spare?: is_spare?,
      is_strike?: is_strike?,
      bonus_status: bonus_status
   }

    return frame_hash
  end 

end 