class Frame
  attr_accessor :roll_1, :roll_2
  
  def spare?
    roll_1 == 10 || roll_1 + roll_2 < 10 ? false : true
  end

  def strike?
    roll_1 == 10 ? true : false
  end

  def total
    return roll_2 == nil ? roll_1 : roll_1 + roll_2
  end
end