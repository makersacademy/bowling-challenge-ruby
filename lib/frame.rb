class Frame

  def initialize(frame)
    @frame = frame
  end

  def score
    @frame.sum
  end
end