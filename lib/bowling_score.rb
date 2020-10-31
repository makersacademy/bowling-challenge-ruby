class BowlingScore

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def total_score
    @rolls.sum
  end

end
