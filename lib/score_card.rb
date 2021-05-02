class ScoreCard
  def frame_scores(frames)
    results = []
    0.upto(frames.length - 1) do |index|
      total_score = basic_frame_score(frames, index)
      if frames[index].first == 10
        total_score += strike_score(frames, index)
      elsif total_score == 10
        total_score += spare_score(frames, index)
      end
      results << total_score
    end
    results
  end

  private

  def basic_frame_score(frames, index)
    frames[index].sum
  end

  def spare_score(frames, index)
    unless last_frame(frames, index)
      return frames[index + 1].first
    end
    0
  end

  def strike_score(frames, index)
    basic_frame_score(frames, index + 1)
  end

  def last_frame(frames, index)
    frames[index + 1].nil?
  end
end
