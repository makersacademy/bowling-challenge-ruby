class Frame 
  attr_reader :finished, :regular_score, :bonus_score, :frame_rolls

  def initialize
    @finished = false
    @regular_score = 0
    @bonus_score = 0
    @frame_rolls = []
  end
end
