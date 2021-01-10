class Scoreboard


  attr_reader :frames

  def initialize
    @frames = []
    @frame_count = 1
    @score = 0
  end


  def add_frame(frame)
    if frame_is_strike?
      frame[0] *= 2 + frame[1] *= 2
    end
    if frame_is_spare?
      frame[0] = frame[0] * 2
    end
    p @frames << frame
    p @score += frame.sum
  end

  def frame_is_spare?
    @frames.length >= 1 && @frames[0] != 10 && @frames[-1].sum == 10
  end

  def frame_is_strike?
    @frames.length >= 1 && @frames = [10, 0] 
  end

  def score
    @score
  end
end
