class BowlingScorer
  def initialize
    @current_score = 0
    @frames = []
  end

  def add_frame(shot1, shot2)
    fail "Looks like you hit the next lane or something, cant knock more than 10" if shot1 + shot2 > 10
    fail "Smells like invalid input" if shot1 < 0 || shot2 < 0
    shot1 == 10 ? current_frame = [10,0] : current_frame = [shot1, shot2]
    @frames << current_frame
    return current_frame
  end

  def check_for_specials(frame)
    message = ""
    if frame[0] == 10
      message = "strike"
    elsif frame.sum == 10
      message = "spare"
    elsif frame.sum == 0
      message = "gutter"
    else
      message = "normal"
    end
    return message
  end

  def count_frame_score(index)
    current_frame = @frames[index]
    previous_frame = @frames[index-1]
    frame_score = current_frame.flatten.sum
    if check_for_specials(previous_frame) == "spare"
      frame_score += current_frame[0]
    elsif check_for_specials(previous_frame) == "strike"
      frame_score += current_frame.sum
    end
    return frame_score
  end

  def frames
    @frames
  end

  def reset_scores_and_frames
    @current_score = 0
    @frames = []
  end
end