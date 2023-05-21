require 'frame'

class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
    update_all_scores(@frames)
  end

  def current_total_score
    return 0 if @frames == []
    frame_scores = @frames.map { |frame|
      frame.score.nil? ? 0 : frame.score
    }
    frame_scores.sum
  end

  private

  def update_score(frame, i)
    return if @frames[-1] == frame
    if frame.spare?
      frame.add_spare_bonus(@frames[i + 1])
    elsif frame.strike?
      frame.add_strike_bonus(@frames[i + 1], @frames[i + 2])
    end
  end

  def update_all_scores(frames)
    frames.each_with_index do |frame, i|
      if frame.score.nil?
        update_score(frame, i)
      end
    end
  end
end