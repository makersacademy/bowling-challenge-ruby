class Frame
  def initialize(roll_one, roll_two = 0)
    @roll_one = roll_one
    @roll_two = roll_two
  end

  def points
    @roll_one + @roll_two
  end

  def strike?
    @roll_one == 10
  end

  def spare?
    points == 10 and @roll_two != 0
  end
end
