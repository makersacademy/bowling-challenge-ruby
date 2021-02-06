class Frame

  def initialize(final_frame: false)
    @scores, @bonus_scores = [], []
    @final_frame = final_frame
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
    total_score == 10 || (strike? && @bonus_scores.length < 2)
  end

  def complete?
    return false if @final_frame && total_score == 10 && @scores.length < 3
    @scores.length >= 2 || strike?
  end

  private

  def strike?
    @scores.length == 1 && @scores.sum == 10
  end

end
