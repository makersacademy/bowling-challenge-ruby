# frozen_string_literal: true

require_relative './frame'

class Game
  MAX_FRAMES = 10

  attr_reader :frame_class

  def initialize(frame_class: Frame)
    @frame_class = frame_class
    @frames = []
    new_frame
  end

  def total_score
    @frames.reduce(0) { |sum, frame| sum + frame.score }
  end

  def bowl(pinfall)
    return total_score if game_over?

    current_frame.roll(pinfall)
    distribute_bonuses(pinfall)
    new_frame if current_frame_over?
    total_score
  end

  def distribute_bonuses(pinfall)
    distribute_previous_frame_bonuses(pinfall) if previous_frame
    distribute_previous_previous_frame_bonuses(pinfall) if previous_previous_frame
  end

  def distribute_previous_frame_bonuses(pinfall)
    previous_frame.add_bonus(pinfall) if previous_frame.strike? && current_frame.rolls < 3
    previous_frame.add_bonus(pinfall) if previous_frame.spare? && current_frame.rolls < 2
  end

  def distribute_previous_previous_frame_bonuses(pinfall)
    if previous_previous_frame.strike? && current_frame.rolls + previous_frame.rolls < 3
      previous_previous_frame.add_bonus(pinfall)
    end
  end

  def current_frame
    @frames.last
  end

  def previous_frame
    @frames[@frames.length - 2] unless @frames.length < 2
  end

  def previous_previous_frame
    @frames[@frames.length - 3] unless @frames.length < 3
  end

  def current_frame_over?
    if last_frame? && current_frame.pinfall >= frame_class::FRAME_PINS
      current_frame.rolls == 3
    else
      current_frame.rolls == frame_class::FRAME_ROLLS || current_frame.pinfall == frame_class::FRAME_PINS
    end
  end

  def last_frame?
    frame_number == MAX_FRAMES
  end

  def frame_number
    @frames.length
  end

  def new_frame
    @frames << frame_class.new
  end

  def game_over?
    frame_number > MAX_FRAMES
  end
end
