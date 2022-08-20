require_relative 'frame'

class FrameRepository
  def initialize
    @frames = []
  end

  def add(frame)
    return @frames << frame.rolls
  end

  def calculate_score
    return @frames.map { |frame| frame.sum }.sum
  end
end