class Frame
  attr_reader :frame_score, :rolls_remaining
  
  def initialize
    @frame_score = []
    @rolls_remaining = 2
  end
end