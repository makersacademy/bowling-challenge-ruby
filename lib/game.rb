class Game

  attr_reader :completed_frames, :current_frame

  def initialize
    @completed_frames = []
    @current_frame = []
  end

  def check_current_frame
    if @current_frame.length == 2
      @completed_frames << @current_frame
      @current_frame = []
    end
    @current_frame
  end

  def record_roll(roll)
    check_current_frame
    @current_frame << roll
  end

  def running_score
    @current_frame.sum + @completed_frames.flatten.sum
  end

end
