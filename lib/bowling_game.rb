require_relative 'bowling_scorecard'

class BowlingGame
  attr_reader :rolls, :scorecard

  def initialize(scorecard = BowlingScorecard.new)
    @scorecard = scorecard
    @rolls = []
  end

  def roll(result)
    @rolls << result
  end

  def total_score
    @scorecard.calculate_frame_scores
  end
end
