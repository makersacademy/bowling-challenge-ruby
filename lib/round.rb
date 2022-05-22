class Round
  def initialize(frames)
    @frames = frames
    @score = 0
  end

  def score
    @frames.each do |frame|
      @score += frame.sum
    end
    @score
  end
end