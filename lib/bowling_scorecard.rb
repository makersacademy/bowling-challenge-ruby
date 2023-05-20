# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end
end
