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
    (0...max).to_a.map { |i| check_frame_score(frames[i], [frames[i + 1], frames[i + 2]]) }
  end

  def check_frame_score(frame, next_frames)
    case frame_type(frame, next_frames.first)
    when :no_bonus then frame.sum
    when :spare then calculate_spare(next_frames.first)
    when :strike then calculate_strike(next_frames.first, next_frames.last)
    end
  end

  def frame_type(frame, next_frame)
    return :no_bonus if next_frame.nil? || frame.nil?
    return :strike if strike?(frame)
    return :spare if spare?(frame)

    :no_bonus
  end

  def calculate_spare(next_frame)
    10 + next_frame.first
  end

  def calculate_strike(next_frame, next_next_frame)
    return 20 + next_next_frame.first if strike?(next_frame) && !next_next_frame.nil?

    10 + next_frame.sum
  end

  def add_up_to_index(frame_scores, index)
    frame_scores.first(index + 1).sum
  end

  def spare?(frame)
    frame.sum == 10 && !strike?(frame)
  end

  def strike?(frame)
    frame.include?(10)
  end
end
