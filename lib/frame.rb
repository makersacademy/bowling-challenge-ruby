class Frame
  attr_reader :number, :scores

  def initialize(frame_number)
    @number = frame_number
    @scores = []
  end

  def add(score)
    @scores << score
  end

  def complete?
    return true if strike?
    @scores.length == 2
  end

  def strike?
    @scores.first == 10
  end
end