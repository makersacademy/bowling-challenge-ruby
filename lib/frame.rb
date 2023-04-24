class Frame
  def initialize(roll_one, roll_two)
    @frame_points = []
    @roll_two = nil
    @roll_three = nil
    add_points(roll_one, roll_two)
  end

  def add_points(roll_one, roll_two)
    @frame_points << roll_one
    @frame_points << roll_two
  end

  def frame_points
    return @frame_points
  end

  def strike?
    @frame_points[0] == 10
  end

  def spare?
    @frame_points[0] != 10 && @frame_points.sum == 10
  end
end