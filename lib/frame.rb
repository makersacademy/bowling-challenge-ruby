class Frame
  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
    @frame_array = [roll_1, roll_2]
  end

  def sum
    return @frame_array.sum
  end

  def spare?
    return @roll_1 != 10 && @frame_array.sum == 10
  end

  def strike?
    return @roll_1 == 10
  end
end