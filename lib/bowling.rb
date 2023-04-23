require 'frame'

class Scorecard
  def initialize
    @frames = []
    @current_frame = 1
    @total_score = 0
  end

  def add_frame_points_to_total_score(frame)
    @frames << frame
    if @frames.last.frame_points[0] == 10
      strike_points
    else @total_score += @frames.last.frame_points
    end
    @current_frame += 1
  end

  def next_frame
    @frames[@current_frame + 1]
  end

  def strike_points
    @total_score += (@frames[next_frame]*2)
  end

  def score_so_far
    return @total_score
  end
end