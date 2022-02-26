# frozen_string_literal: true

require 'frame'

class ScoreCard
  FIRST_ROLL = 1
  SECOND_ROLL = 2
  FINAL_ROLL = 3
  LAST_FRAME = 10
  TEN_PINS = 10
  ZERO_SCORE = 0

  def initialize(frame_class = Frame, last_frame_class = LastFrame)
    @frame_class = frame_class
    @last_frame_class = last_frame_class
    @frames = {}
  end

  def current_frame_number
    @frames.count
  end

  def log_roll(pins_downed)
    return :game_complete if game_complete?
    current_frame.log_roll(pins_downed)
  end

  def score
    score = 0
    @frames.each do |frame_no, frame|
      score += process_frame(frame_no, frame) if frame.frame_complete?
    end
    score
  end

  private
  def game_complete?
    @frames.count == LAST_FRAME && @frames[LAST_FRAME].frame_complete?
  end

  def process_frame(frame_no, frame)
    if frame.strike_frame?
      strike_points(frame_no)
    elsif frame.spare_frame?
      spare_points(frame_no)
    else
      frame.roll_score(FIRST_ROLL) + frame.roll_score(SECOND_ROLL)
    end
  end

  def current_frame
    if next_frame?
      @frames[@frames.count + 1] = last_frame_next? ? @last_frame_class.new : @frame_class.new
    end
    @frames[@frames.keys.last]
  end

  def next_frame?
    return true if @frames.empty?
    return false if @frames.count == LAST_FRAME
    return true if @frames[@frames.keys.last].frame_complete?

    false
  end

  def last_frame_next?
    @frames.count + 1 == LAST_FRAME
  end

  # For the sake of readability I have decided not to split this function any further
  def strike_points(frame_no)
    if frame_no == LAST_FRAME
      last_frame = @frames[frame_no]
      return TEN_PINS + last_frame.roll_score(SECOND_ROLL) + last_frame.roll_score(FINAL_ROLL)
    end

    if @frames.key?(frame_no + 1)
      next_frame = @frames[frame_no + 1]
      if next_frame.roll_score(SECOND_ROLL)
        return TEN_PINS + next_frame.roll_score(FIRST_ROLL) + next_frame.roll_score(SECOND_ROLL); end
      if @frames.key?(frame_no + 2)
        return TEN_PINS + next_frame.roll_score(FIRST_ROLL) + @frames[frame_no + 2].roll_score(FIRST_ROLL); end
    end
    ZERO_SCORE
  end

  def spare_points(frame_no)
    if frame_no == LAST_FRAME
      @frames[frame_no].roll_score(FINAL_ROLL) + TEN_PINS
    else
      @frames.key?(frame_no + 1) ? @frames[frame_no + 1].roll_score(FIRST_ROLL) + TEN_PINS : ZERO_SCORE
    end
  end
end
