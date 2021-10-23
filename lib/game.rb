class Game

  attr_reader :frames

  def initialize(frame = Frame)
    @frames = []
    10.times { @frames << frame.new }

  end

  def current_score
    score = 0
    frames.each { |frame| score += frame.score if frame.score }
    score
  end

end