class Frame
  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
    @rolls = [roll_1, roll_2]
  end

  attr_accessor :roll_1, :roll_2, :rolls

  def sum
    return @rolls.sum
  end

  def spare?
    return @roll_1 != 10 && @rolls.sum == 10
  end

  def strike?
    return @roll_1 == 10
  end
end