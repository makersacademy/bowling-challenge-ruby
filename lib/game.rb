class Game

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
  end

  def total_score
    @frames.map do |frame|
      frame.scores
    end.flatten.sum
  end
end