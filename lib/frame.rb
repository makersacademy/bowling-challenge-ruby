class Frame
  def initialize(num)
    @frame_num = num
    @frame_score = 0
    @roll_1 = 0
    @roll_2 = 0
    @strike = false
    @spare = false
    @bonus = 0
  end

  def frame
    @frame_num
  end

  def frame_score
    @frame_score
  end

  def add_roll_1(num)
    @roll_1 = num
  end

  def roll_1
    @roll_1
  end

  def add_roll_2(num)
    @roll_2 = num
  end

  def roll_2
    @roll_2
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

  def is_spare?
    @spare
  end

  def add_frame_total(num)
    @frame_score += num
  end

  def add_bonus(num)
    @bonus = num
  end

  def bonus
    @bonus
  end
  
end