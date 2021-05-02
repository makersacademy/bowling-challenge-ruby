class ScoreCalculator
  def game_score(frames)
    frame_scores(frames).sum
  end

  def frame_scores(frames)
    frame_scores_list = []
    frames.each.with_index do |frame, index|
      frame_score = if tenth_frame?(index)
                      tenth_frame_score(frame)
                    else
                      mid_game_frame_score(frames, index)
                    end
      frame_scores_list << frame_score
    end
    frame_scores_list
  end

  private

  def tenth_frame_score(frame)
    frame.sum
  end

  def mid_game_frame_score(frames, index)
    total_score = basic_frame_score(frames[index])
    if spare?(frames[index])
      total_score += spare_bonus_score(frames, index)
    elsif strike?(frames[index])
      total_score += strike_bonus_score(frames, index)
    end
    total_score
  end

  def basic_frame_score(frame)
    frame[0..1].sum
  end

  def spare_bonus_score(frames, index)
    if last_frame?(frames, index)
      0
    else
      frames[index + 1].first
    end
  end

  def strike_bonus_score(frames, index)
    if last_frame?(frames, index)
      0
    elsif strike?(frames[index + 1])
      strike_follows_strike_bonus_score(frames, index)
    else
      basic_frame_score(frames[index + 1])
    end
  end

  def strike_follows_strike_bonus_score(frames, index)
    if ninth_frame?(index)
      basic_frame_score(frames[index + 1])
    else
      spare_bonus_score(frames, index) + spare_bonus_score(frames, index + 1)
    end
  end

  def all_pins_down?(score)
    score == 10
  end

  def spare?(frame)
    all_pins_down?(basic_frame_score(frame)) unless strike?(frame)
  end

  def strike?(frame)
    all_pins_down?(frame.first)
  end

  def last_frame?(frames, index)
    frames[index + 1].nil?
  end

  def ninth_frame?(index)
    index == 8
  end

  def tenth_frame?(index)
    index == 9
  end
end
