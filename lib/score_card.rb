class ScoreCard
  def frame_scores(frames)
    results = []
    frames.each.with_index do |frame, index|
      total_score = basic_frame_score(frame)
      if frame.first == 10
        total_score += strike_bonus_score(frames, index)
      elsif total_score == 10
        total_score += spare_bonus_score(frames, index)
      end
      results << total_score
    end
    results
  end

  private

  def basic_frame_score(frame)
    frame.sum
  end

  def spare_bonus_score(frames, index)
    if last_frame?(frames, index)
      0
    else
      frames[index + 1].first
    end
  end

  def strike_bonus_score(frames, index)
    basic_frame_score(frames[index + 1])
  end

  def last_frame?(frames, index)
    frames[index + 1].nil?
  end
end
