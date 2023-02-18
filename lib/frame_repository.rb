#require 'frame'

class FrameRepository
  def initialize
      @roll_score= []
    end
  
  def add(roll)
  while true do
  @roll_score << roll
  break if @roll_score.length <= 20
  end 
  end
  
  def score_card
  return @roll_score.sum
  end
end