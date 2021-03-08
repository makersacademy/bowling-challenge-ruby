class Frame
  attr_reader :frame

  def initialize(*args)
    @frame = args
  end


  def is_strike?
    @frame.first == 10
  end

  def is_spare?
    @frame.sum == 10 && @frame.first != 10
  end

  def add(score)
    @frame << score
  end

  def total
    @frame.flatten.sum
  end

  def values
    @frame.dup
  end
end
