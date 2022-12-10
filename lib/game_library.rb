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
    end

    @frame << roll.score
    if @frame.length == 2
      @game << @frame
      @frame = []
    end
    
    return nil
  end

  def rolls_by_frame
    return @game
  end

end
