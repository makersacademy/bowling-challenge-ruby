class Scoreboard



  attr_reader :frames



  def initialize
    @frames = []
    @score = 0
  end


  def add_frame(frame)
    if first_frame_is_strike?
      frame[0] = frame[0] * 2
      frame[1] = frame[1] * 2
    elsif first_frame_is_spare?
      frame[0] = frame[0] * 2
    end
    @frames << frame
    @score += frame.sum
  end

  def first_frame_is_spare?
    @frames.length >= 1 && @frames[-1].sum == 10
  end

  def first_frame_is_strike?
    @frames.length >= 1 && @frames[-1][0] == 10
  end

  def score
    @score
  end
end
