require 'frame'

class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def current_total_score
    return 0 if @frames == []
    sum = 0
    @frames.each_with_index do |frame, i|
      if frame.spare? && @frames[-1] != frame
        frame.add_spare_bonus(@frames[i + 1])
      end
      sum += score_to_i(frame.score)
    end
    sum
  end

  private

  def score_to_i(score)
    return score.nil? ? 0 : score
  end

end