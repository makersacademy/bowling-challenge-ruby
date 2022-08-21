require_relative 'frame'

class Scorecard
  def initialize
    @frames = []
  end

  def add(frame)
    @frames << frame
  end

  def calculate_score
    return 0
  end
end