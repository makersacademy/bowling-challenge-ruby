require 'roll'
require 'frame_counter'

class GameLibrary
  def initialize
    @game = []
    @frame = []
  end

  def add(roll) 
    frames = FrameCounter.new(@game)
    
    if frames.max_number_of_frame?
      return nil
    else
      add_roll_to_frame(frames, roll)
    end

    return nil
  end

  def rolls_by_frame
    return @game
  end

  private

  def add_roll_to_frame(frames, roll)
    frame_length = 2
    @frame << roll.score

    if @frame.sum >= 10
      if frames.total_number == 9
        frame_length = 3
      else
        frame_length = 1
      end
    end

    if @frame.length >= frame_length
      @game << @frame
      @frame = []
    end
    
    return nil
  end

end
