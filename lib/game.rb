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
    update_frames(score)
    new_frame if need_new_frame?
  end

  def update_correct_roll_in_frame(score)
    if tenth_frame_and_bonus_roll_granted?
      update_bonus_roll(score)
    elsif current_frame.roll_one.nil?
      update_roll_one(score)
    else
      update_roll_two(score)
    end
  end

  def new_frame
    @current_frame_number += 1
    @current_frame = Frame.new(current_frame_number)
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def update_previous_frames(score)
    # return nil if on first frame
    return if current_frame_number == 1

    previous_frame = calculate_previous_frame
    frame_before_last = calculate_frame_before_last
    if on_first_roll_of_frame?
      update(previous_frame, frame_before_last, score) if previous_frame.spare_or_strike?
    elsif bonus_roll_incomplete_and_strike?(previous_frame)
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
      print_all(frame)
    end
    puts "Total: #{total_score}"
  end

  private

  def print_all(frame)
    if frame.number < TOTAL_NUMBER_OF_FRAMES
      print_regular(frame)
    elsif frame.number == TOTAL_NUMBER_OF_FRAMES
      print_tenth(frame)
    end
  end

  def print_tenth(frame)
    print "Frame: #{frame.number} Roll 1: #{frame.roll_one} "
    print "Roll 2: #{frame.roll_two} Roll 3: #{frame.bonus_roll} "
    puts "Score: #{frame.score}"
  end

  def print_regular(frame)
    puts "Frame: #{frame.number} Roll 1: #{frame.roll_one} Roll 2: #{frame.roll_two} Score: #{frame.score}"
  end

  def update_frames(score)
    update_correct_roll_in_frame(score)
    current_frame.calculate_score
    update_previous_frames(score)
  end

  def update_bonus_roll(score)
    current_frame.bonus_roll = score
  end

  def update_roll_one(score)
    current_frame.roll_one = score
  end

  def update_roll_two(score)
    current_frame.roll_two = score
  end

  def need_new_frame?
    current_frame.finished?
  end

  def tenth_frame_and_bonus_roll_granted?
    current_frame_number == 10 && !current_frame.roll_two.nil?
  end

  def on_first_roll_of_frame?
    current_frame.roll_two.nil?
  end

  def update(previous_frame, frame_before_last, score)
    previous_frame.score += score
    return if current_frame_number <= 2

    frame_before_last.score += score if previous_frame.strike? && frame_before_last.strike?
  end

  def bonus_roll_incomplete_and_strike?(previous_frame)
    previous_frame.strike? && current_frame.bonus_roll.nil?
  end

  def calculate_previous_frame
    frames["frame_#{current_frame_number - 1}"]
  end

  def calculate_frame_before_last
    frames["frame_#{current_frame_number - 2}"]
  end
end
