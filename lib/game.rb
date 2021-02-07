# frozen_string_literal: true

require_relative 'frame'

# Game class
class Game

  TOTAL_NUMBER_OF_FRAMES = 10

  attr_reader :total_score, :current_frame_number, :current_frame, :frames

  def initialize
    @total_score = 0
    @current_frame_number = 1
    @current_frame = Frame.new(current_frame_number)
    @frames = {}
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def bowl(score)
    update_correct_roll_in_frame(score)
    @current_frame.calculate_score
    update_previous_frames(score)
    new_frame if need_new_frame?
  end

  def update_correct_roll_in_frame(score)
    if current_frame.roll_one.nil?
      current_frame.roll_one = score
    else
      current_frame.roll_two = score
    end
  end

  def need_new_frame?
    current_frame.finished?
  end

  def new_frame
    # create new frame
    @current_frame_number += 1
    @current_frame = Frame.new(current_frame_number)
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def update_previous_frames(score)
    # return nil if on first frame
    return if current_frame_number == 1

    previous_frame = frames["frame_#{current_frame_number - 1}"]
    frame_before_last = frames["frame_#{current_frame_number - 2}"]
    # check only one roll has been made in the current frame
    if current_frame.roll_two.nil?
      # add most recent score to previous frame if it was a spare or strike
      if previous_frame.spare_or_strike?
        previous_frame.score += score
        return if current_frame_number <= 2

        frame_before_last.score += score if previous_frame.strike? && frame_before_last.strike?
      end
    elsif previous_frame.strike?
      previous_frame.score += score
    end
  end

  def print_scorecard
    i = 0
    total_score = 0
    until i == current_frame_number
      i += 1
      frame = frames["frame_#{i}"]
      total_score += frame.score
      if frame.number <= TOTAL_NUMBER_OF_FRAMES
        puts "Frame: #{frame.number} Roll 1: #{frame.roll_one} Roll 2: #{frame.roll_two} Score: #{frame.score}"
      end
    end
    puts "Total: #{total_score}"
  end
end
