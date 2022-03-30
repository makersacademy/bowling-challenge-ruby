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

  def add_bonus_points(current_frame_number)
    current_frame = @frames[current_frame_number - 1] 
    prev_frame1 = @frames[current_frame_number - 2] 
    prev_frame2 = @frames[current_frame_number - 3]

    if current_frame_number > 1 && (prev_frame1.strike || prev_frame1.spare)
      add_bonus_for_last_frame(current_frame, prev_frame1)
    end

    if current_frame_number > 2 && (prev_frame1.strike && prev_frame2.strike)
      add_bonus_for_two_frames_ago(current_frame, prev_frame1, prev_frame2)
    end
  end

  def add_final_round_bonus_points(current_frame_number, number)
    current_frame = @frames[current_frame_number - 1] 
    previous_frame = @frames[current_frame_number - 2]
    if previous_frame.strike && current_frame.strike && current_frame_number == 10 
      previous_frame.final_round_bonus(current_frame.rolls[0])
      previous_frame.final_round_bonus(number)
    end
    if current_frame_number == 10 && current_frame.spare
      current_frame.final_round_bonus(number)
      update_total(current_frame.bonus.sum)
      END_OF_FRAME
    elsif current_frame_number == 10 && current_frame.strike && current_frame.bonus.empty?
      current_frame.final_round_bonus(number)
    elsif current_frame_number == 10 && current_frame.strike && current_frame.bonus.length == 1
      current_frame.final_round_bonus(number)
      update_total(current_frame.bonus.sum)
      END_OF_FRAME
    end
  end

  def score_breakdown(reason = USER_REQUEST)
    breakdown = "Frame | Pins | Bonus    \n=====================\n"
    @frames.each_with_index do |frame, index|
      breakdown += "  #{index + 1}  | #{frame.rolls[0]} , #{frame.rolls[1]} |  #{frame.bonus.sum}\n"
    end
    if reason == GAME_OVER
      breakdown += "=====================\n FINAL SCORE: #{@current_score}\n=====================\n *** GAME OVER *** "
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

private

def add_bonus_for_last_frame(current_frame, prev_frame1)
  prev_frame1.add_bonus(current_frame)
  update_total(prev_frame1.bonus.sum)
end

def add_bonus_for_two_frames_ago(current_frame, prev_frame1, prev_frame2)
  prev_frame2.add_bonus(current_frame, prev_frame1)
  update_total(prev_frame2.bonus.sum)
end