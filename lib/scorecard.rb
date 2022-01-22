# frozen_string_literal: true

class Scorecard
  def initialize(frames:, last_frame:)
    @frames = frames
    @last_frame = last_frame
  end

  def total_score
    @frames + @last_frame
  end
end
