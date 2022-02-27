require './lib/frame'

class ScoreCard

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @frames = {}
  end

  def score
    score = 0
  end

  def frame_number
    @frames.count
  end

  def roll(pin_count)
    
  end

end
