class Frame

  attr_reader :roll_1, :roll_2, :roll_3
  attr_accessor :tenth_frame

  MAXIMUM_SCORE = 10
  def initialize
    @roll_1 = nil
    @roll_2 = nil
    @tenth_frame = false
    @roll_3 = nil
  end

  def add_roll(roll)
    fail 'Maximum score of 10 allowed' if roll > MAXIMUM_SCORE
    if @roll_1 == nil
      @roll_1 = roll
    elsif @roll_2 == nil
      fail 'Maximum score of 10 allowed' if @roll_1 + roll > MAXIMUM_SCORE && @tenth_frame == false
      @roll_2 = roll 
    else
      fail "Can't have more than 2 rolls" if @tenth_frame == false
      @roll_3 = roll
    end
  end

  def complete?
    return true if regular_frame_complete? || tenth_frame_complete?
    return false
  end

  def spare?
    return true if @roll_2 != nil && @roll_1 + @roll_2 == MAXIMUM_SCORE
    return false
  end

  def strike?
    return true if @roll_1 == MAXIMUM_SCORE
    return false
  end

  def regular_frame_complete?
    return false if @tenth_frame 
    return true if strike?
    return true if @roll_1 != nil && @roll_2 != nil 
    return false
  end

  def tenth_frame_complete?
    if @tenth_frame 
      if @roll_3 != nil
        return true
      elsif spare? || strike?
        return false
      elsif @roll_2 != nil
        return true
      else 
        return false
      end
    end
    return false
  end

  def frame_score
    score = @roll_1
    score += @roll_2 if @roll_2 != nil
    score += @roll_3 if @roll_3 != nil
    return score
  end
end