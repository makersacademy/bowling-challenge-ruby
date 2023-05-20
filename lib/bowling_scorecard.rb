# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end

  def calculate_frame_scores(rolls)
    @frame_scores = rolls.each_slice(2).map do |first_roll, second_roll| 
      first_roll + second_roll
    end
    
  end
end

