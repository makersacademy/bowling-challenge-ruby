require 'frame'

class BowlingGame
  attr_reader :frames, :total_score

  def initialize
    @frames = []
    @total_score = 0
  end

  def add_frame(frame)
    @frames << frame
    update_total
  end

  def update_total
    @frames.each do |frame|
      @total_score += frame.score
    end
  end
end