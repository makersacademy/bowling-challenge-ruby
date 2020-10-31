class BowlingScore 
  def initialize
    @rolls = []
  end

  def roll(score)
    @rolls << score
  end

  def total_score
    @rolls.sum
  end
end