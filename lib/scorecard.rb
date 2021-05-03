class Scorecard
  attr_reader :scorecard

  def initialize
    @scorecard = []
  end

  def add_score(score)
    frame = Hash.new(0)
    frame[:total_score] += 5
    @scorecard << frame
  end
end
