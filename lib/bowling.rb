require 'frame'

class Scorecard
  def initialize
    @frames = []
    @current_frame = 0
    @total_score = 0
  end

  def add_frame_points_to_total_score(frame)
    while @current_frame < 10 do
      @frames << frame
      @current_frame += 1
    end
  end

  def score_so_far
    if @frames.empty?
      return 0
    elsif @frames.last.strike?
      strike_points
    else
      @total_score += @frames.last.frame_points
    end
    return @total_score
  end

  def strike_points
    next_frame = @frames[@current_frame+1]
    if next_frame == nil
      @total_score += 10
    else
      @total_score += 10
      @total_score += next_frame.frame_point
    end
  end
end