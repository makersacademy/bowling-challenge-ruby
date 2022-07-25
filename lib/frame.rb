class Frame
  def initialize(roll_1, roll_2)
     @roll_1 = roll_1
     @roll_2 = roll_2
     @bonus = 0
  end
  
  def roll_1
    return @roll_1
  end
  
  def roll_2
    return @roll_2
  end

  # bonus getter - returns the bonus value
  def bonus
    return @bonus
  end

  # bonus setter - sets bonus attribute to given value
  def bonus(bonus)
     @bonus = bonus
  end
  
  def is_strike
    return @roll_1 == 10
  end
  
  def is_spare
    return !is_strike && (@roll_1 + @roll_2 == 10)
  end
  
  def sum
    return @roll_1 + @roll_2 + @bonus
  end
end