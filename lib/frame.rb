class Frame
  def initialize
    @scores = []
  end

  def add_ball(score)
    @scores << score
  end

  def scores
    @scores
  end

  def frame_score
    @scores.sum
  end

  def strike?
    @scores[0] == 10 ? true : false
  end
  
  def spare?
    @scores.length == 2 && frame_score == 10 ? true : false
  end
end
