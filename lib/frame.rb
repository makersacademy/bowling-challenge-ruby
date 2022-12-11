class Frame
  def initialize(num)
    @frame_num = num
    @frame_score = 0
    @roll_1 = 0
    @roll_2 = 0
    @strike = false
    @spare = false
    @bonus_score = 0
  end

  def frame
    @frame_num
  end

  def frame_score
    @frame_score
  end

  def strike
    @strike = true
  end

  def is_strike?
    @strike
  end

  def spare
    @spare = true
  end

  def add_frame_total(num)
    @frame_score += num
  end

  def bonus
    @bonus
  end
  
end