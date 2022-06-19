def score_calc(all_frames)
  all_frames.map { |frame| frame.sum }.sum
end