require 'frame'

class Game
  def initialize
    @completed_frames = []
    @current_frame = []
  end

  def add(roll) 
    if max_number_of_frames?
      return nil
    else
      add_roll_to_frame(roll)
    end

    return nil
  end

  def completed_frames
    return @completed_frames
  end

  def current_frame
    return @current_frame
  end
  
  def view_completed_frames
    completed_frames = []
    
    @completed_frames.each do |frame|
      completed_frames << frame.scores
    end

    return completed_frames
  end

  private

  def add_roll_to_frame(roll)
    @current_frame << roll
    current_frame = Frame.new(@current_frame)

    if current_frame.complete?(frame_count)
      @completed_frames << current_frame
      @current_frame = []
    end
  end

  def frame_count
    return @completed_frames.length
  end
  
  def max_number_of_frames?
    return frame_count >= 10 ? true : false
  end   

end
