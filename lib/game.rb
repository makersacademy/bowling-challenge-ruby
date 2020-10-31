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
    @current_frame << roll
    check_current_frame
  end

  def running_score
    completed_frames_with_spares = @completed_frames.each_with_index do |frame, index|
      if frame.sum == 10
        @completed_frames[index+1][0] *= 2
      end
    end
    @current_frame.sum + completed_frames_with_spares.flatten.sum
  end

end
