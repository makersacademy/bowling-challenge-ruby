class Frame
  def initialize(num)
    @frame_num = num
    @frame_score = 0
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

  
end