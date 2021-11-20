# frozen_string_literal: true

# This class initializes with an array of pins knocked down with a series of bowls
class Scorecard
  DEFAULT_BOWLS = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].freeze

  attr_reader :bowls

  def initialize(bowls = DEFAULT_BOWLS)
    @bowls = bowls
  end

  def frames
    check_strikes(@bowls).each_slice(2).to_a
  end

  def final_score
    frame_scores.sum
  end

  def final_scorecard
    frame_scores.map.with_index { |_f, i| add_up_to_index(frame_scores, i) }
  end

  private

  # Ensures each frame will have two values by adding a 0 after each 10
  def check_strikes(bowls)
    bowls.map { |v| v == 10 ? [10, 0] : v }.flatten
  end

  # Maps the individual scores of frames 0 - 9
  def frame_scores
    (0..9).to_a.map { |i| check_frame_score(i) if i < 10 }
  end

  def check_frame_score(ind, framesum = frames[ind].sum)
    framesum < 10 ? framesum : resolve_spare_strike(ind)
  end

  def resolve_spare_strike(ind)
    spare?(frames[ind]) ? frames[ind].sum + frames[ind + 1].first : resolve_strike(ind)
  end

  def spare?(frame)
    frame.sum == 10 && !strike?(frame)
  end

  def resolve_strike(ind, next_frame = frames[ind + 1])
    10 + (strike?(next_frame) ? 10 + frames[ind + 2].first : next_frame.sum)
  end

  def add_up_to_index(frame_scores, index)
    frame_scores.first(index + 1).sum
  end

  def strike?(frame)
    frame.include?(10)
  end
end
