class BowlingScore
  attr_reader :scorecard
  
  def initialize
    @scorecard = 0
  end

  def score(roll)
    roll
    @scorecard =+ roll
  end
end