# frozen_string_literal: true

# ScoreCard class
class ScoreCard
  attr_reader :score, :rolls

  def initialize
    @score = 0
    @rolls = 0
    @to_be_named = [
      # { frame: frame_count,
      #   roll: roll_count,
      #   knocked_pins:,
      #   total_score:,
      #   notes:
      # }
    ]
  end

  def roll(pins)
    @rolls += 1
    @score += pins
  end

  def frame_count
    (@rolls / 2.0).round
  end

  def roll_count
    @rolls / frame_count
  end
end
