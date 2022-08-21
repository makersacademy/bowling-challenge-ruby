require_relative 'frame'

class Scorecard
  def initialize
    @frames = []
  end

  def add(frame)
    @frames << frame
  end
end