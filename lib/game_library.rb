class GameLibrary
  def initialize
    @game = []
    @frame = []
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
    return @game
  end

  private

  def add_roll_to_frame(roll)
    frame_length = 2
    @frame << roll

    if @frame.sum >= 10
      total_number_of_frames == 9 ? frame_length = 3 : frame_length = 1
    end

    if @frame.length >= frame_length
      @game << @frame
      @frame = []
    end
  end

  def total_number_of_frames
    return @game.length
  end
  
  def max_number_of_frame?
    total_number_of_frames >= 10 ? true : false
  end   

end
