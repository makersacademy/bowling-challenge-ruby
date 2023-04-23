class Frame
  def initialize
    @frame_points = []
  end

  def roll_one(pins)
    @frame_points << pins
  end

  def roll_two(pins)
    @frame_points << pins
  end

  def frame_points
    @frame_points.sum
  end

  def strike
    if frame_points[0] == 10
      strike == true
    end
  end

  def spare
    if frame_points.sum == 10
      spare == true
    end
  end
end