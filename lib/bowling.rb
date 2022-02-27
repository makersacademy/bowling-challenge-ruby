class Bowling
  attr_reader :total_score, :frame

  def initialize
    @total_score = 0
  end

  def total_frames(frame_scores)
    raise 'Minimum of 10 frames must be entered' if frame_scores.count < 10
    # p frame_scores
    frame_scores.map.with_index do |frame, index|
      unless [9, 10, 11].include?(index)
        if back_to_back_strike?(frame, frame_scores, index)
          frame_scores[index] = [frame[0], (frame_scores[index + 1].sum + frame_scores[index + 2].sum)]
        elsif strike?(frame)
          frame_scores[index] = [frame[0], frame_scores[index + 1].sum]
        elsif spare?(frame)
          frame_scores[index] = [frame[0], (frame[1] + (frame_scores[index + 1][0]))]
        end
      end
    end
    # p frame_scores
    frame_scores.each { |scores| @total_score += scores.sum }
    total_score
  end

  def strike?(frame)
    frame[0] == 10
  end

  def back_to_back_strike?(frame, frame_scores, index)
    frame[0] == 10 && frame_scores[index + 1][0] == 10
  end

  def spare?(frame)
    frame[0] != 10 && frame.sum == 10
  end

end
