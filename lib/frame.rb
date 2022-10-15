class Frame
  def initialize(roll1, roll2)
  @roll1 = roll1
  @roll2 = roll2
  @frame = []
  end

  def roll1
    @roll1
  end

  def roll2
    @roll2
  end

  def add_rolls
    @frame << roll1 << roll2
  end

  def frame_arr
    @frame
  end
end