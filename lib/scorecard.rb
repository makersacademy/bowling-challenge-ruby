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

  private

  # Ensures each frame will have two values by adding a 0 after each 10
  def check_strikes(bowls)
    bowls.map.with_index { |v, i| v == 10 ? [10, 0] : v }.flatten
  end

  # Maps the individual scores of frames 0 - 9
  def frame_scores
    (0..9).to_a.map { |i| check_frame_score(i) if i < 10 }
  end

  def check_frame_score(i, framesum = frames[i].sum)
    framesum < 10 ? framesum : resolve_spare_strike(i)
  end

  def resolve_spare_strike(i)
    spare?(frames[i]) ? frames[i].sum + frames[i + 1].first : resolve_strike(i)
  end

  def spare?(frame)
    (frame.sum == 10) && !(frame.include?(10))
  end

  def resolve_strike(i)
    return 20 + frames[i + 2].first if frames[i + 1].include?(10)
    return 10 + frames[i + 1].sum
  end

end
