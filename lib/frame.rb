class Frame
  def initialize
    @ball_scores = [0, 0, 0]
    @bonus_score = 0
    @strike = false
    @spare = false
  end

  def add_ball_score(ball, ball_score)
    @ball_scores[ball - 1] = ball_score
  end

  def get_ball_score(ball)
    return @ball_scores[ball - 1]
  end

  def update_bonus_score(score)
    @bonus_score = score
  end

  def bonus_score
    return @bonus_score
  end

  # Returns true if this is a complete frame with no strike
  def two_balls?
    return true if (get_ball_score(1) != 0 && get_ball_score(2) != 0)
  end
  
  def strike(ball)
    @strike = true
    add_ball_score(ball, 10)
  end

  def strike?
    return true if @strike == true
    return false
  end
  
  def spare
    @spare = true
    score = 10 - get_ball_score(1)
    add_ball_score(2, score)
  end

  def spare?
    return true if @spare == true
    return false
  end
  
  def frame_score
    return @ball_scores.sum
  end

  def total_frame_score
    return @ball_scores.sum + @bonus_score
  end
end
