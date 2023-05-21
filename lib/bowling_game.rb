require 'frame'

class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def total_score
    return 0 if @frames == []
    sum = 0
    @frames.each do |frame|
      sum += frame.score unless frame.score.nil?
    end
    sum
  end
end