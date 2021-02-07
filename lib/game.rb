# frozen_string_literal: true
require_relative 'frame'

# Game class
class Game

  attr_reader :total_score, :current_frame_number, :current_frame, :frames

  def initialize
    @total_score = 0
    @current_frame_number = 1
    @current_frame = Frame.new(current_frame_number)
    @frames = Hash.new
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def bowl(score)
    @total_score += score
    new_frame if need_new_frame?
    update_correct_roll_in_frame(score)
    update_previous_frames(score)
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
    # calculate score of frame just finished
    @current_frame.calculate_score
    # create new frame
    @current_frame_number += 1
    @current_frame = Frame.new(current_frame_number)
    @frames["frame_#{current_frame_number}"] = current_frame
  end

  def update_previous_frames(score)
    #check only one roll has been made in the current frame
    return if current_frame_number == 1
    if current_frame.roll_two.nil?
      if frames["frame_#{current_frame_number - 1}"].spare?
        frames["frame_#{current_frame_number - 1}"].score += score
      end
    end
  end
end
