# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end

  def calculate_frame_scores(rolls)
    rolls.each_slice(2) do |first_roll, second_roll|
      frame_score = calculate_frame_score(first_roll, second_roll)
      @frame_scores << frame_score
    end

    @frame_scores
  end

  private

  def calculate_frame_score(first_roll, second_roll)
    return 10 if first_roll == 10

    first_roll + second_roll
  end
end
