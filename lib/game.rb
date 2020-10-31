class Game

  def initialize
    @completed_frames = []
    @current_frame = []
  end

  def current_frame
    @current_frame
  end

  def record_roll(roll)
    @current_frame << roll
  end

  def running_score
    @current_frame.sum + @completed_frames.sum
  end

end
