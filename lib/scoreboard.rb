class Scoreboard


  attr_reader :frames

  def initialize
    @frames = []
    @frame_count = 1
    @score = 0
  end


  def add_frame(frame)
    if spare?
      frame[0] = frame[0] * 2
    end
    if strike?(frame)
      frame[0] = frame[0] * 2
      frame[1] = frame[1] * 2
    end
    p @frames << frame
    p @score += frame.sum
  end

  def spare?
    @frames.length >= 1 && @frames[-1].sum == 10
  end

  def strike?(frame)
    frame[0] == 10
  end

  def score
    @score
  end
end
