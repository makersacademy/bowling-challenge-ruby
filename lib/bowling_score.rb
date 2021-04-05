class BowlingScore
  attr_reader :total_score

  def initialize
    @total_score = 0
  end

  def roll(pins)
    @total_score += pins
  end
end
