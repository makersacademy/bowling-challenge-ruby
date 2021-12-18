# frozen_string_literal: true
require_relative 'frame'

class Points
  attr_reader :current_score, :frames

  USER_REQUEST = 'USER REQUEST'
  GAME_OVER = 'GAME OVER'

  def initialize
    @current_score = 0

    @frames = []

    10.times { @frames << Frame.new }
  end

  def update_roll(current_frame, current_roll, pins_knocked_down)
    frame_index = current_frame - 1
    @frames[frame_index].update_roll(current_roll, pins_knocked_down)
    if current_roll == 2
      update_total(@frames[frame_index].rolls.sum)
    end
  end

  def update_total(score)
    @current_score += score
  end

  def score_breakdown(reason = USER_REQUEST)
    breakdown = "Frame | Pins | Bonus    \n=====================\n"
    @frames.each_with_index do |frame, index|
      breakdown += "  #{index + 1}  | #{frame.rolls[0]} , #{frame.rolls[1]} |\n"
    end
    if reason == GAME_OVER
      breakdown += " *** GAME OVER *** "
      reset
    end
    breakdown
  end

  def reset
    @current_score = 0
    @frames = []
    10.times { @frames << Frame.new }
  end
end
