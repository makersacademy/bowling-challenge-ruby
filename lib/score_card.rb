require 'frame'

class ScoreCard
  def initialize
    @total_score = 0
    @frames = []
  end

  def frames
    @frames
  end
  
  def new_frame
    Frame.new(1)
  end

  def total_score
    @total_score
  end

  def add_to_total(num)
    @total_score += num
  end
end
