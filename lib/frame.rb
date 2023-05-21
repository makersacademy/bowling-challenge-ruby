class Frame
  attr_reader :scores

  def initialize(*scores)
    @scores = scores
  end

  def strike?
    @scores.first == 10
  end

  def spare?
    !strike? && @scores.sum == 10
  end
end
