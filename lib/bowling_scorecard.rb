# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end

  def calculate_frame_scores(rolls)
    rolls_by_frame = clean(rolls)
    
    rolls_by_frame.take(10).each_with_index do |(first_roll, second_roll), frame|
      next_two_frames = [rolls_by_frame[frame + 1], rolls_by_frame[frame + 2]]
      base_frame_score = first_roll + second_roll
      frame_score_with_bonus = calculate_bonus(base_frame_score, next_two_frames, second_roll)
      @frame_scores << frame_score_with_bonus
    end
    @frame_scores
  end

  private

  # uses the second roll to determine if the frame is a strike or spare
  # (strikes will be followed by 0 due to #clean(rolls)) then applies the appropriate bonus
  def calculate_bonus(base_frame_score, next_two_frames, second_roll)
    next_frame = next_two_frames[0]
    frame_after_next = next_two_frames[1]
    return base_frame_score if (0..9).cover?(base_frame_score) || next_frame.nil?

    if second_roll.zero? && next_frame[0] == 10 # if it's a strike followed by a strike
      frame_after_next.nil? ? 20 : 20 + frame_after_next[0]
    elsif second_roll.zero? # if it's a single strike
      base_frame_score + next_frame.sum
    else # if it's a spare
      base_frame_score + next_frame[0]
    end
  end

  # returns an array of ten arrays that represent frames with two rolls each
  # 0s are added after a strike to ensure there are always 10, two-element arrays
  def clean(rolls)
    rolls.each_index do |index|
      rolls.insert(index + 1, 0) if rolls[index] == 10
    end.each_slice(2).to_a
  end
end
