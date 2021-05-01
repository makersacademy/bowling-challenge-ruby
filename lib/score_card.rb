class ScoreCard
  def frame_scores(frames)
    frame = frames[0]
    total_score = 0
    frame.each { |score| total_score += score }
    [total_score]
  end
end
