class Frame
  def initialize(rolls = [0,0])
    @roll_1 = rolls[0]
    @roll_2 = rolls[1]
    @score = rolls
    @strike = false
    @spare = false
  end

  def return_frame_scores
    return @score
  end

  def total
    return @roll_1 + @roll_2
  end

  def is_valid
    if @score[0] + @score[1] > 10
      return false
    else 
      return true
    end
  end

  def is_strike
    if @roll_1 == 10
      @strike = true
    end
    return @strike
  end

  def is_spare
    if total == 10 && is_strike == false
      @spare = true
    end

    return @spare
  end
end

