class Frame
  attr_reader :frame_score, :rolls_remaining

  def initialize
    @frame_score = []
    @rolls_remaining = 2
  end

  def add_score(num)
    @frame_score << num
  end

  def last_score
    @frame_score.last
  end
end