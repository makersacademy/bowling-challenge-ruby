class Frame
  def initialize
    @scores = []
  end

  def add(score)
    @scores << score
  end

  def scores
    @scores
  end
end
