class Frame
  def initialize 
  @rolls = []
  @closed = false
  @pins_left = 10
  @roll_counter = 0
  @roll_score = 0
  end

  def roll(pins)
    # pins is number of pins knocked down in a roll
    add pins to @rolls
    @roll_counter += 1
    @pins_left = @pins_left - pins
  end

  def frame_score
    # list of scores
  end

  def frame_total
    # add together frame scores
  end

  def strike
    # rolls 10 on first go
  end

  def spare
    # total 10 in 2 rolls
  end

  def closed?
    # changes closed to true if strike or spare or 2 rolls

  end

  def bonus
  end
    
end