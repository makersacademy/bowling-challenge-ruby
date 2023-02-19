class Frame
  attr_reader :scores, :roll

  def initialize(is_tenth)
    @is_tenth = is_tenth
    @scores = @is_tenth ? [0, 0, 0] : [0, 0]
    @roll = 0
  end

  def add_score(score)
    return if is_ended?()
    @scores[roll] = score
    @roll += 1
  end

  def total_score
    return @scores.sum
  end

  def is_ended?
    # check if it's the 10th
    if @is_tenth
      # check if a strike or spare
      if @roll == 2 && @scores[0] + @scores[1] < 10
        return true
      elsif @roll == 3
        return true
      end
      return false
      # if it's not the 10th
    else
      if @scores[0] == 10 || @roll == 2
        return true
      end
      return false
    end
  end

  def status
    return "strike" if is_strike?()
    return "spare" if is_spare?()
    return "normal"
  end

  private

  def is_strike?
    return @scores[0] == 10
  end

  def is_spare?
    return @scores[0] + @scores[1] == 10
  end
end
