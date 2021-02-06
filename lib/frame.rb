class Frame

  def initialize
    @scores, @bonus_scores = [], []
  end

  def total_score
    @scores.sum + @bonus_scores.sum
  end

  def add_score(score)
    @scores << score
  end

  def add_bonus_score(score)
    @bonus_scores << score
  end

  def need_bonus?
    total_score == 10 || strike?
  end

  private

  def strike?
    @scores.length == 1 && @scores.sum == 10
  end

end
