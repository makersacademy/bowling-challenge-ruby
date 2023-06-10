class Frame
  def initialize(frame_number)
    @frame_number = frame_number
    @ball_scores = [0, 0, 0]
  end

  def add_ball_score(ball, score)
    @ball_scores[ball - 1] = score
  end

  def get_ball_score(ball)
    return @ball_scores[ball - 1]
  end

  def frame_number
    return @frame_number
  end
end