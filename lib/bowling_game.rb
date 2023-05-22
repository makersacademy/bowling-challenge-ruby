require_relative './frame'

class BowlingGame
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(frame)
    @frames << frame
    update_all_scores(@frames)
  end

  def total_up_to(i)
    return nil if frames[i].score.nil?
    return score_sum(@frames, i)
  end

  private

  # We require methods to:
  # - sum all the scores up to ith index,
  # - update the score of a frame based on the following frames (if a spare or strike)
  # - update all the frame scores in the frames array

  def score_sum(frames, i)
    frames[0..i].reduce(0) { |sum, frame|
      sum + frame.score.to_i
    }
  end

  def update_score(frame)
    return if @frames[-1] == frame || !frame.score.nil?
    i = @frames.index(frame)

    if frame.spare?
      frame.add_spare_bonus(@frames[i + 1])
    elsif frame.strike?
      frame.add_strike_bonus(
      @frames[i + 1],
      @frames[i + 2]
    )
    end
  end

  def update_all_scores(frames)
    frames.each do |frame|
      update_score(frame)
    end
  end
end
