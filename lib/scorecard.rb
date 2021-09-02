class Scorecard

  def scorecard(frames, scores)
    frames.map do |frame| 
      print "\n#{scorecard_string(frame, scores)}\n#{total_score(scores)}"
    end
  end

  private

  def scorecard_string(frame, scores)
    "Frame: #{frame.frame_id.to_s.ljust(2)} | #{frame.roll_1}"\
    " | #{frame.roll_2.to_s.ljust(1)} | "\
    "#{"#{frame.roll_3}" if frame.roll_3}\n"\
    "Score: #{score_tally(frame, scores.flatten)}\n"
  end

  def score_tally(frame, scores)
    (0...frame.frame_id).map { |score| scores[score] }.compact.sum
  end

  def total_score(scores)
    "TOTAL: #{scores.flatten.compact.sum}\n"
  end

end
