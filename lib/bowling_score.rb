class BowlingScore
  attr_reader :scorecard, :score_counter, :frame_number

  def initialize
    @scorecard = Array.new(10) { Array.new }
    @frame_number = 0
    @score_counter = 0
  end

  def score(pins)
    @scorecard << pins
    @score_counter += pins
    print_score
  end

  def increment_frame
    @frame_number += 1
    p "Frame: #{@frames}"
  end

  def print_score
    p "Your score is #{@score_counter}"
  end
end

# - user enters roll
# - roll added to the array in scorecard equivalent to (frame number - 1) - frame 1 would access array at index 0
# - when 2 entries (or 1 strike) are in the array, the frame is complete
# - if the sum of the two entries in a frame array = 10 (strike or spare) score calculation waits until the next roll to calculate bonuses