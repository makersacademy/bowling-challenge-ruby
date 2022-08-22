class Frame

  def initialize(frame)
    fail "invalid frame" if (frame.length == 2) && (frame[1] == 10)
    fail "invalid frame" if (frame.length == 1) && (frame[0] != 10)
    @frame = frame
  end

  def score
    @frame.sum
  end

  def to_a
    @frame
  end

  def nrolls
    @frame.length
  end

  def spare_or_strike
    return true if @frame.sum == 10
    return true if @frame.length == 3 && @frame[0..1].sum == 10
    false
  end

  def strike
    return true if spare_or_strike && @frame.length == 1
    return true if @frame.length == 3 && @frame[0] == 10
    false
  end
end