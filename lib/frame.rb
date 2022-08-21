class Frame
  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end

  attr_accessor :roll_1, :roll_2

  def sum
    return @roll_1 + @roll_2
  end

  def spare?
    return @roll_1 != 10 && sum == 10
  end

  def strike?
    return @roll_1 == 10
  end
end