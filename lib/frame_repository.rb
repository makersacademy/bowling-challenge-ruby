#require 'frame'

class FrameRepository
  def initialize
      @frame_score= []
  end
  
  def add(roll)
    while true do
      @frame_score << roll
      break if @frame_score.length <= 2
   end 
  end
  
  def frame_score
    return @frame_score.sum
  end
end