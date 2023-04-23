class Frame
  def initialize
    @frame_points = []
  end

  def roll_points(roll_one, roll_two)
    @frame_points << roll_one
    if roll_one != 10
      @frame_points << roll_two
    end
  end

  def frame_points
    return @frame_points.sum
  end

  def strike?
    @frame_points[0] == 10
  end

  def spare?
    @frame_points[0] != 10 && @frame_points.sum == 10
  end
end