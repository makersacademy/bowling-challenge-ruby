class BowlingScore
  attr_reader :scorecard
  
  def initialize
    @scorecard = 0
  end

  def score(pins)
    pins
    @scorecard =+ pins
  end
end