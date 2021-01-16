class Scoreboard



  attr_reader :frames



  def initialize
    @frames = []
    @frame_count = 0
    @score = 0
  end


  def add_frame(frame)
    if strike?
      puts 'Inside add_frame method when roll 1 is equal to 10 and roll 2 is equal to 0'
      frame[0] = frame[0] * 2
      frame[1] = frame[1] * 2
    elsif last_frame_is_spare?
      frame[0] = frame[0] * 2
    end
    p @frames << frame
    p @score += frame.sum
    p @frame_count += 1
  end

  def last_frame_is_spare?
    @frames.length >= 1 && @frames[-1].sum == 10
  end

  def strike?
    @frames.length >= 1 && @frames[-1][0] == 10
  end

  def score
    @score
  end
end
