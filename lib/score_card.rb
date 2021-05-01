class ScoreCard
  def frame_scores(frames)
    results = []
    frames.each do |frame|
      total_score = 0
      frame.each { |score| total_score += score }
      results << total_score
    end
    results
  end
end
