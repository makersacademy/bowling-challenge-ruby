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
    frame_scores =  @scorecard.calculate_frame_scores(@rolls)
    return frame_scores.sum
  end
end
