class Score

  attr_reader :scores

  def initialize
    @scores = []
  end

  def calculate(frame)
    if frame == [10]
      @scores << 'X'
    elsif frame.sum == 10
      @scores << '/'
    else
      @scores << frame.sum
    end
  end

end
