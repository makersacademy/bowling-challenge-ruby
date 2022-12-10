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

  def random_num
    p rand(11)
  end
end
