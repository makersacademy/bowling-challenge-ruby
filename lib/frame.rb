class Frame
  attr_reader :frame_score, :current_roll, :rolls_remaining

  def initialize 
    @frame_score = 0
    @current_roll = 0
    @rolls_remaining = 2
  end

  def add_roll(pins)
    @current_roll += 1
    @frame_score += pins
    update_rolls_remaining
  end

  def strike?
    @current_roll == 1 && @frame_score == 10
  end

  def split?
    @current_roll == 2 && @frame_score == 10
  end

  def update_rolls_remaining
    @rolls_remaining -= 1 unless strike? or split?
  end

  def frameover?
    @rolls_remaining == 0
  end
end
