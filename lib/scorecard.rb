# frozen_string_literal: true

require_relative 'frame'

# This class initializes with an array of pins knocked down with a series of bowls
class Scorecard
  DEFAULT_BOWLS = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].freeze

  attr_reader :bowls

  def initialize(bowls = DEFAULT_BOWLS)
    @bowls = bowls
  end

  def score
    frame_scores.sum
  end

  def accumulative_scores
    frame_scores.map.with_index { |_f, i| add_up_to_index(frame_scores, i) }
  end

  private

  # Maps the individual scores of frames 0 - 9
  def frame_scores
    (0...max_frames).to_a.map { |i| get_frame_score(i) }
  end

  def max_frames
    frames.count >= 10 ? 10 : frames.count
  end

  def get_frame_score(ind)
    ENV['ENVIRONMENT'] == 'test' ? frames[ind] : frames[ind].score
  end

  # Converts a sliced bowls array into an array of Frame objects
  def frames
    to_frames(slice_bowls_array)
  end

  def to_frames(sliced_bowls)
    sliced_bowls.map.with_index { |_f, i| create_frame(sliced_bowls, i) }
  end

  def create_frame(sliced_bowls, ind)
    ENV['ENVIRONMENT'] == 'test' ? 1 : Frame.new(sliced_bowls[ind], sliced_bowls[ind + 1], sliced_bowls[ind + 2])
  end

  # Slices a bowls array into 2-value arrays, e.g. [1,2,10,3,4] => [[1,2],[10,0],[3,4]]
  def slice_bowls_array
    presliced_bowls = add_zeros_after_tens(@bowls)
    presliced_bowls.each_slice(2).to_a
  end

  def add_zeros_after_tens(bowls)
    bowls.map { |bowl| bowl == 10 ? [bowl, 0] : [bowl] }.flatten
  end

  def add_up_to_index(frame_scores, index)
    frame_scores.first(index + 1).sum
  end
end
