# frozen_string_literal: true
require_relative 'frame'

class Points
  attr_reader :current_score, :frames

  USER_REQUEST = 'USER REQUEST'
  GAME_OVER = 'GAME OVER'
  END_OF_FRAME = true

  def initialize
    @current_score = 0

    @frames = []

    10.times { @frames << Frame.new }
  end

  def update_roll(current_frame, current_roll, pins_knocked_down)
    frame_index = current_frame - 1
    @frames[frame_index].update_roll(current_roll, pins_knocked_down)
    if current_roll == 2 || @frames[frame_index].strike == true
      update_total(@frames[frame_index].rolls.sum)
      END_OF_FRAME
    else
      !END_OF_FRAME
    end
  end

  def update_total(score)
    @current_score += score
  end

  def add_bonus_points_for_last_frame(current_frame_number)
    prev_frame = @frames[current_frame_number - 2] 
    current_frame = @frames[current_frame_number - 1] 
    prev_frame.add_bonus(current_frame)
    update_total(prev_frame.bonus)
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
