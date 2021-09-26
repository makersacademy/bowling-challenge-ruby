class Game

    attr_reader :roll_one, :roll_two

  def initialize(roll_one, roll_two)
    @roll_one = roll_one 
    @roll_two = roll_two 
  end 

  def total_of_frame
    roll_one + roll_two 
  end

  def spare?
    if roll_one + roll_two == 10 && roll_one != 10 
      true 
    else 
      false
    end
  end 

  def strike?
    if roll_one == 10 && roll_two == 0
      true 
    else 
      false 
    end 
  end 

end 