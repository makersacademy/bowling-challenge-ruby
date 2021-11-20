# frozen_string_literal: true

# This class initializes with an array of pins knocked down with a series of bowls
class Scorecard
  DEFAULT_BOWLS = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].freeze

  attr_reader :bowls

  def initialize(bowls = DEFAULT_BOWLS)
    @bowls = bowls
  end

  def frames
    presliced_bowls = add_zeros_after_tens(@bowls)
    presliced_bowls.each_slice(2).to_a
  end

  def score
    frame_scores.sum
  end

  def accumulative_scores
    frame_scores.map.with_index { |_f, i| add_up_to_index(frame_scores, i) }
  end

  private

  # Ensures each frame will have two values by adding a 0 after each 10
  def add_zeros_after_tens(bowls)
    bowls.map { |bowl| bowl == 10 ? [bowl, 0] : [bowl] }.flatten
  end

  # Maps the individual scores of frames 0 - 9
  def frame_scores
    max = (frames.count >= 10 ? 10 : frames.count)
    (0...max).to_a.map { |i| check_frame_score(i) }
  end

  def check_frame_score(ind, frame = frames[ind], up_frame = frames[ind + 1], upup_frame = frames[ind + 2])
    case
      when frame.sum < 10 then frame.sum
      when up_frame.nil? then 10 # i.e. a spare/strike, but no bonus points available
      when spare?(frame) then calculate_spare(frame, up_frame)
      else calculate_strike(frame, up_frame, upup_frame)
    end
  end

  def calculate_spare(frame, next_frame)
    frame.sum + next_frame.first
  end

  def calculate_strike(frame, next_frame, next_next_frame)
    return 20 + next_next_frame.first if strike?(next_frame) && !next_next_frame.nil?

    10 + next_frame.sum
  end

  def add_up_to_index(frame_scores, index)
    frame_scores.first(index + 1).sum
  end

  def spare?(frame)
    return false if frame.nil?

    frame.sum == 10 && !strike?(frame)
  end

  def strike?(frame)
    return false if frame.nil?

    frame.include?(10)
  end
end
