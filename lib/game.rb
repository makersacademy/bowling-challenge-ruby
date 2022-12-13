class Game
  def initialize
    @completed_frames = []
    @current_frame = []
  end

  def add(roll) 
    if max_number_of_frame?
      return nil
    else
      add_roll_to_frame(roll)
    end

    return nil
  end

  def rolls_by_frame
    return @completed_frames
  end

  private

  def add_roll_to_frame(roll)
    frame_length = 2
    @current_frame << roll

    if @current_frame.sum >= 10
      total_number_of_frames == 9 ? frame_length = 3 : frame_length = 1
    end

    if @current_frame.length >= frame_length
      @completed_frames << @current_frame
      @current_frame = []
    end

  end

  def total_number_of_frames
    return @completed_frames.length
  end
  
  def max_number_of_frame?
    total_number_of_frames >= 10 ? true : false
  end   

end
