class ScoreCalculator
  def initialize
    @frames = []
  end

  def game_score(frames)
    frame_scores(frames).sum
  end

  def frame_scores(frames)
    @frames = frames
    frame_scores_list = []
    @frames.each.with_index do |_frame, index|
      frame_score = if tenth_frame?(index)
                      tenth_frame_score
                    else
                      mid_game_frame_score(index)
                    end
      frame_scores_list << frame_score
    end
    frame_scores_list
  end

  private

  def tenth_frame_score
    @frames[9].sum
  end

  def mid_game_frame_score(index)
    total_score = basic_frame_score(index)
    if spare?(index)
      total_score += spare_bonus_score(index)
    elsif strike?(index)
      total_score += strike_bonus_score(index)
    end
    total_score
  end

  def basic_frame_score(index)
    @frames[index][0..1].sum
  end

  def spare_bonus_score(index)
    if last_frame?(index)
      0
    else
      @frames[index + 1].first
    end
  end

  def strike_bonus_score(index)
    if last_frame?(index)
      0
    elsif strike?(index + 1)
      strike_follows_strike_bonus_score(index)
    else
      basic_frame_score(index + 1)
    end
  end

  def strike_follows_strike_bonus_score(index)
    if ninth_frame?(index)
      basic_frame_score(index + 1)
    else
      spare_bonus_score(index) + spare_bonus_score(index + 1)
    end
  end

  def all_pins_down?(score)
    score == 10
  end

  def spare?(index)
    all_pins_down?(basic_frame_score(index)) unless strike?(index)
  end

  def strike?(index)
    all_pins_down?(@frames[index].first)
  end

  def last_frame?(index)
    @frames[index + 1].nil?
  end

  def ninth_frame?(index)
    index == 8
  end

  def tenth_frame?(index)
    index == 9
  end
end
