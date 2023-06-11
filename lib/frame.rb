class Frame
  def initialize(frame_number)
    @frame_number = frame_number
    @ball_scores = [0, 0, 0]
    @bonus_score = 0
  end

  def add_ball_score(ball, score)
    @ball_scores[ball - 1] = score
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

  def strike?
    return true if get_ball_score(1) == 'X'
  end

  def spare?
    return true if get_ball_score(2) == '/'
  end

  def frame_number
    return @frame_number
  end

  def score
    scores = @ball_scores
    scores[0] = 10 if scores[0] == 'X'
    scores[1] = 10 if scores[1] == 'X'
    scores[2] = 10 if scores[2] == 'X'
    scores[1] = 10 - scores[0] if scores[1] == '/'

    return scores.sum + @bonus_score
  end
end
