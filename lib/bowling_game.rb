require 'frame'

class BowlingGame
  attr_reader :frames, :total_score

  def initialize
    @frames = []
    @total_score = 0
    @frame_scores = {}
  end

  def add_frame(frame)
    @frames << frame
    update_total(frame)
  end

  def update_total(frame)
    return if frame.score.nil?
    
    @total_score += frame.score
  end
end