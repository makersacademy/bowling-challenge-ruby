require 'frame'

class Game
  def initialize
    @all_frames = []
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

  def all_frames
    return @all_frames
  end

  def current_frame
    return @current_frame
  end
  
  def frames_with_scores
    frames_with_scores = []
    
    @all_frames.each do |frame|
      frames_with_scores << frame.scores
    end

    return frames_with_scores
  end

  private

  def add_roll_to_frame(roll)
    @current_frame << roll

    if @current_frame.length > 1
      @all_frames.pop
    end

    current_frame = Frame.new(@current_frame)
    @all_frames << current_frame
    
    if current_frame.complete?(frame_count)
      @current_frame = []
    end
  end

  def frame_count
    return @all_frames.length
  end
  
  def max_number_of_frames?
    return frame_count >= 10 && @current_frame == [] ? true : false
  end   

end
