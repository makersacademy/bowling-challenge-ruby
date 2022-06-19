def score_calc(all_frames)
  score = []
  all_frames.each_with_index do |frame, index| 
    # sum each frame
    score <<frame.sum
    # if a spare, also push the first index of the next frame
    if frame.length == 2 && frame.sum == 10
      score << all_frames[index + 1][0]
    end
  end
  score.sum
end