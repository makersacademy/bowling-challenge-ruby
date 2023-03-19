class Bowling

  def initialize
    @scores = 0
  end

  def roll(score)
    @scores += score
  end

  def total_score
    return @scores
  end

end