# this class represents a scorecard for a bowling game
class BowlingScorecard
  attr_reader :frame_scores

  def initialize
    @frame_scores = []
  end

  def calculate_frame_scores(rolls)
    rolls_by_frame = clean(rolls)
    
    rolls_by_frame.each_with_index do |(first_roll, second_roll), frame|
      next_frame = rolls_by_frame[frame + 1]
    
      base_frame_score = calculate_frame_score(first_roll, second_roll)
      frame_score_with_bonus = calculate_bonus(base_frame_score, next_frame)

      @frame_scores << frame_score_with_bonus
    end
    @frame_scores
  end

  private

  def calculate_frame_score(first_roll, second_roll)
    return 10 if first_roll == 10

    first_roll + second_roll
  end

  def calculate_bonus(frame_score, next_frame)
    return frame_score if next_frame.nil? || (0..9).cover?(frame_score)

    frame_score + next_frame[0]
  end

  # returns an array of ten arrays that represent frames with two rolls each
  # 0s are added after a strike to ensure there are always 10, two-element arrays
  def clean(rolls)
    rolls.each_index do |index|
      if rolls[index] == 10
        rolls.insert(index + 1, 0)
      end
    end.each_slice(2).to_a
  end

end
