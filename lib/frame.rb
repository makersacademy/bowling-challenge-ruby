class Frame
  attr_reader :frame_score, :current_roll

  def initialize 
    @frame_score = 0
    @current_roll = 0
    @rolls_remaining = 2
  end

  def add_roll(pins)
    @current_roll += 1
    @frame_score += pins
  end

  def strike?
    @current_roll == 1 && @frame_score == 10
  end
end
