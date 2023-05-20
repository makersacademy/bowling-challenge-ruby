# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end

  def calculate_frame_scores(rolls)
    frame = rolls.sum
    @frame_scores << frame
  end
end
