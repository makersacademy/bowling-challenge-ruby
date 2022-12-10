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

  def score_sum
    @scores.sum
  end
end
