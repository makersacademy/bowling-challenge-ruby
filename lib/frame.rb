class Frame
  def initialize(roll_one, roll_two = 0)
    @roll_one = roll_one
    @roll_two = roll_two
  end

  def total_points
    @roll_one + @roll_two
  end
end