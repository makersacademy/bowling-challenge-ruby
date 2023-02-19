class Frame
  attr_reader :scores

  def initialize(is_tenth) # is_tenth is a boolean
    @is_tenth = is_tenth
    @scores = @is_tenth ? [0, 0, 0] : [0, 0]
    @roll = 0
  end

  # adds the score to the frame
  def add_score(score) # score is a Integer
    return if is_ended?()
    @scores[@roll] = score
    @roll += 1
  end

  # calculates the sum of the @scores array, returns an integer
  def total_score
    return @scores.sum
  end

  # checks if this frame ends, returns a boolean
  def is_ended?
    # checks if it's the 10th
    if @is_tenth
      # checks if the first 2 game is a spare, ends this frame if it's not
      if @roll == 2 && @scores[0] + @scores[1] < 10
        return true
      elsif @roll == 3
        # ends the game when there are 3 rolls
        return true
      end
      return false
    else
      # if it's not the 10th
      # checks if the first game is a strike or finishes 2 rolls in this frame
      if @scores[0] == 10 || @roll == 2
        return true
      end
      return false
    end
  end

  # returns a string
  def status
    return "strike" if is_strike?()
    return "spare" if is_spare?()
    return "normal"
  end

  private

  # checks if it's a strike
  # returns a boolean
  def is_strike?
    return @scores[0] == 10
  end

  # checks if it's a spare
  # returns a boolean
  def is_spare?
    return @scores[0] + @scores[1] == 10
  end
end
