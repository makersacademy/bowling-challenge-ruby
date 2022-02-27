# frozen_string_literal: true

class Game
  attr_reader :frames, :display

  def initialize(
    bowl_class: Bowl,
    display_class: Display,
    frame_class: Frame,
    framescore_class: FrameScore,
    scores_class: Scores
  )
    @bowl_class = bowl_class
    @display_class = display_class
    @frame_class = frame_class
    @framescore_class = framescore_class
    @scores_class = scores_class
    @display = display_class.new
    @frames = []
    @open_frame = nil
    @scores = scores_class.new(display: @display)
    @current = {
      frame: 1,
      bowl: 1
    }
  end

  def add_bowl(pins:)
    add_bonus_to_frames(pins)
    if @current[:frame] == 10
      final_frame(pins)
    elsif @current[:bowl] == 1
      create_new_frame(pins)
    else
      add_bowl_to_current_frame(pins)
    end
  end

  private

  def create_new_bowl(pins)
    @bowl_class.new(pins: pins)
  end

  def create_new_frame(pins)
    @open_frame = @frame_class.new(number: @current[:frame], score_table: @scores)
    verify_pins_and_create_bowl_object(pins)
    check_for_strike(pins)
  end

  def add_bowl_to_current_frame(pins)
    verify_pins_and_create_bowl_object(pins)
    score_frame
  end

  def verify_pins_and_create_bowl_object(pins)
    ErrorChecker.new(
      pins: pins,
      current_bowl: @current[:bowl],
      current_frame: @current[:frame],
      open_frame: @open_frame
    )
    bowl = create_new_bowl(pins)
    @open_frame.add(bowl: bowl)
  end

  def check_for_strike(pins)
    score_frame if pins == 10
    @current[:bowl] += 1 if pins < 10
  end

  def final_frame(pins)
    if @current[:bowl] == 1
      @open_frame = @frame_class.new(number: @current[:frame], score_table: @scores)
    end
    verify_pins_and_create_bowl_object(pins)
    check_final_frame_over
  end

  def check_final_frame_over
    score_frame if @current[:bowl] == 2 && @open_frame.pins_total < 10
    score_frame if @current[:bowl] == 3
    @current[:bowl] += 1
  end

  def score_frame
    @open_frame.push_score
    @display.update_pins(frame_number: @current[:frame], pins: @open_frame.pins)
    push_current_frame_to_frames
    update_counters
  end

  def push_current_frame_to_frames
    @frames.push(@open_frame)
    @open_frame = nil
  end

  def update_counters
    @current[:frame] += 1 unless @current[:frame] >= 10
    @current[:bowl] = 1
  end

  def add_bonus_to_frames(pins)
    bonus_frames = @frames.select { |frame| frame.score.final == false }
    bonus_frames.each { |frame| frame.score.add_bonus_bowl(pins: pins) }
  end
end
