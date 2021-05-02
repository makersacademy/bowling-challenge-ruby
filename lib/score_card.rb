class ScoreCard
  def frame_scores(frames)
    results = []
    0.upto(frames.length - 1) do |index|
      total_score = basic_frame_score(frames, index)
      total_score += spare(frames, index) if total_score == 10
      results << total_score
    end
    results
  end

  private

  def basic_frame_score(frames, index)
    total_score = 0
    frames[index].each { |score| total_score += score }
    total_score
  end

  def spare(frames, index)
    frames[index + 1].first
  end
end
