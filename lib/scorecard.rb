require_relative 'scoretracker'

class ScoreCard

  attr_reader :scores

  def initialize(scoretracker = ScoreTracker)
    @scores = scoretracker.new
  end

end