require 'frame'

class Scorecard
  def initialize
    @frames = []
    @current_frame = 1
    @total_score = 0
  end

  def add_frame_points_to_total_score(frame)
    @frames << frame
    @total_score += @frames.last.frame_points
    @current_frame += 1
  end

  def score_so_far
    return @total_score
  end
end