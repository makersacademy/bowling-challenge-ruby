class Frame
  attr_accessor :first_roll, :second_roll
  def initialize(first_roll, second_roll=0)
    @first_roll = first_roll
    @second_roll = second_roll
  end
  
  def strike?
    return @first_roll == 10 
  end

  def spare?
    return !strike? && score == 10
  end

  def score

    return (@first_roll + @second_roll)
  end
end