# frozen_string_literal: true

class Game
  attr_reader :frames

  def initialize(frame_class: Frame, bowl_class: Bowl, framescore_class: FrameScore)
    @bowl_class = bowl_class
    @frame_class = frame_class
    @framescore_class = framescore_class
    @frames = []
    @open_frame = nil
    @current = {
      frame: 1,
      bowl: 1
    }
  end

  def add_bowl(pins:)
    if @current[:bowl] == 1
      create_new_frame(pins)
    else
      add_bowl_to_current_frame(pins)
    end
    add_bonus_to_frames(pins)
  end

  private

  def create_new_bowl(pins)
    @bowl_class.new(pins: pins)
  end

  def create_new_frame(pins)
    error_checks(pins)
    bowl = create_new_bowl(pins)
    @open_frame = @frame_class.new(number: @current[:frame])
    @open_frame.add(bowl: bowl)
    check_for_strike(pins)
  end

  def add_bowl_to_current_frame(pins)
    error_checks(pins)
    bowl = create_new_bowl(pins)
    @open_frame.add(bowl: bowl)
    score_frame
  end

  def check_for_strike(pins)
    score_frame if pins == 10
    @current[:bowl] += 1 if pins < 10
  end

  def score_frame
    create_score_object
    push_score_to_frame
    push_current_frame_to_frames
    update_counters
  end

  def create_score_object
    score = @framescore_class.new(frame: @open_frame)
  end

  def push_score_to_frame
    @open_frame.push_score
  end

  def push_current_frame_to_frames
    @frames.push(@open_frame)
    @open_frame = nil
  end

  def update_counters
    @current[:frame] += 1
    @current[:bowl] = 1
  end

  def add_bonus_to_frames(pins)
    bonus_frames = @frames.select { |frame| frame.score.final == false }
    bonus_frames.each { |frame| frame.score.add_bonus_bowl(pins: pins) }
  end

  def error_checks(pins)
    invalid_pins(pins)
    invalid_total(pins) if @current[:bowl] == 2
  end

  def invalid_pins(pins)
    raise('Your score must be between 0 and 10') if
      pins.negative? || (pins > 10)
  end

  def invalid_total(pins)
    raise('Your total score for the frame cannot exceed 10; please check your scores') if
      (@open_frame.pins + pins) > 10
  end
end
