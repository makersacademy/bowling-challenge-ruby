# frozen_string_literal: true

require_relative 'frame'

# Game class
class Game
  TOTAL_NUMBER_OF_FRAMES = 10

  attr_reader :total_score, :current_frame_number, :current_frame, :frames

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @total_score = 0
    @current_frame_number = 1
    @current_frame = frame_class.new(current_frame_number)
    @frames = {}
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def bowl(score)
    update_frames(score)
    new_frame if current_frame.finished?
  end

  def update_correct_roll_in_frame(score)
    if current_frame_number == 10 && !current_frame.roll_two.nil?
      update_bonus_roll(score)
    elsif current_frame.roll_one.nil?
      update_roll_one(score)
    else
      update_roll_two(score)
    end
  end

  def new_frame
    @current_frame_number += 1
    @current_frame = @frame_class.new(current_frame_number)
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def update_previous_frames(score)
    return if current_frame_number == 1

    previous_frame = frames["frame_#{current_frame_number - 1}"]
    frame_before_last = frames["frame_#{current_frame_number - 2}"]
    if first_roll_of_frame_and_spare_or_strike_on?(previous_frame)
      update(previous_frame, frame_before_last, score)
    elsif bonus_roll_incomplete_and_strike_on?(previous_frame)
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
      print_each(frame)
    end
    puts "Total: #{total_score}"
  end

  private

  def print_each(frame)
    if frame.number < TOTAL_NUMBER_OF_FRAMES
      puts "Frame: #{frame.number} Roll 1: #{frame.roll_one} Roll 2: #{frame.roll_two} Score: #{frame.score}"
    elsif frame.number == TOTAL_NUMBER_OF_FRAMES
      print_tenth(frame)
    end
  end

  def print_tenth(frame)
    print "Frame: #{frame.number} Roll 1: #{frame.roll_one} "
    print "Roll 2: #{frame.roll_two} Roll 3: #{frame.bonus_roll} "
    puts "Score: #{frame.score}"
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

  def first_roll_of_frame_and_spare_or_strike_on?(previous_frame)
    current_frame.roll_two.nil? && previous_frame.spare_or_strike?
  end

  def update(previous_frame, frame_before_last, score)
    previous_frame.score += score
    return if current_frame_number <= 2

    frame_before_last.score += score if previous_frame.strike? && frame_before_last.strike?
  end

  def bonus_roll_incomplete_and_strike_on?(previous_frame)
    previous_frame.strike? && current_frame.bonus_roll.nil?
  end
end
