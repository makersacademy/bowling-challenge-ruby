require 'frame'

class Scorecard
  def initialize
    @frames = []
    @current_frame = 1
    @total_score = 0
  end

  def add_frame_points_to_total_score(frame)
    @frames << frame
    @current_frame += 1
  end

  def score_so_far
    if @frames.empty?
      return 0
    elsif @frames.last.frame_points == 10
      strike_points
    else
      @total_score += @frames.last.frame_points
    end
    return @total_score
  end

  def frame_strike
    @frames.last.strike?
  end

  def frame_spare
    @frames.last.spare?
  end

  def next_frame
    @frames[@current_frame + 1]
  end

  def strike_points
    @total_score += next_frame.frame_points * 2
  end
end