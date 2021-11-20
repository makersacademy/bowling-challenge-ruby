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

  def frame_scores
    scores = []
    wc = 0
    max = frames.length
    while wc < max
      if wc < 10
        if frames[wc].sum == 0
          # puts "i:#{wc}, gutter ball"
          scores << 0
        elsif frames[wc].sum < 10
          # puts "i:#{wc}, normal ball"
          scores << frames[wc].sum
        elsif spare?(frames[wc])
          # puts "i:#{wc}, spare"
          scores << frames[wc].sum + frames[wc + 1].first
        elsif frames[wc + 1].include?(10)
          # puts "i:#{wc}, STRIKE, next one also a strike"
          scores << 20 + frames[wc + 2].first
        else
          # puts "i:#{wc}, STRIKE, followed by other"
          scores << 10 + frames[wc + 1].sum
        end
      end
      wc += 1
    end
    scores
  end

  def spare?(frame)
    (frame.sum == 10) && !(frame.include?(10))
  end

end
