# frozen_string_literal: true

class Scorecard
  def initialize(frames)
    @frames = frames
  end

  def frame_interpreter; end

  def total_score
    score = 0
    @frames.each do |frame|
      case frame.size
      when 2
        score += frame[:roll1]
      when 3
        score += frame[:roll1]
        score += frame[:roll2]
      end
    end
    score
  end
end
