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

  def strike?
    @scores[0] == 10 ? true : false
  end
  
  def spare?
    @scores.length == 2 && score_sum == 10 ? true : false
  end
end
