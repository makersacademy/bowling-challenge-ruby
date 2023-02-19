class Frame
  attr_reader :scores, :roll

  def initialize
    @scores = [0, 0]
    @roll = 0
  end

  def add_score(score)
    return if is_ended?()
    @scores[roll] = score
    @roll += 1
  end

  def first_score
    return @scores[0]
  end

  def total_score
    return @scores.sum
  end

  def is_ended?
    if @roll == 2
      return true
    end
    return false
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
