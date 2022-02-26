# frozen_string_literal: true

require 'frame'

class ScoreCard
  FIRST_ROLL = 1
  SECOND_ROLL = 2
  FINAL_ROLL = 3
  LAST_FRAME = 10
  TEN_PINS_DOWN = 10

  def initialize(frame_class = Frame)
    @frame_class = frame_class
    @frames = {}
  end

  def current_frame_number
    @frames.count
  end

  def log_roll(pins_downed)
    current_frame.log_roll(pins_downed)
  end

  def score
    score = 0
    @frames.each do |frame_no, frame|
      if frame_no == LAST_FRAME
        score += process_frame(frame_no, frame)
      elsif frame.frame_complete?
        score += process_frame(frame_no, frame)
      end
    end
    score
  end

  private

  def process_frame(frame_no, frame)
    if frame.strike_frame?
      strike_points(frame_no)
    elsif frame.spare_frame?
      spare_points(frame_no)
    else
      frame.roll_score(FIRST_ROLL).to_i + frame.roll_score(SECOND_ROLL).to_i
    end
  end

  def current_frame
    @frames[@frames.count + 1] = @frame_class.new if new_frame?
    @frames[@frames.keys.last]
  end

  def new_frame?
    return true if @frames.empty?
    return false if @frames.count == LAST_FRAME
    return true if @frames[@frames.keys.last].frame_complete?

    false
  end

  def strike_points(frame_no)
    if frame_no == LAST_FRAME
      last_frame = @frames[frame_no]
      return 10 + last_frame.roll_score(SECOND_ROLL) + last_frame.roll_score(FINAL_ROLL)
    end

    if @frames.key?(frame_no + 1)
      next_frame = @frames[frame_no + 1]
      # 2 rolls for this frame?
      if next_frame.roll_score(SECOND_ROLL); return 10 + next_frame.roll_score(FIRST_ROLL) + next_frame.roll_score(SECOND_ROLL);end
      if @frames.key?(frame_no + 2); return 10 + next_frame.roll_score(FIRST_ROLL) + @frames[frame_no + 2].roll_score(FIRST_ROLL); end
    end
    # Nothing to match on..
    0
  end

  def spare_points(frame_no)
    if frame_no == LAST_FRAME
      last_frame = @frames[frame_no]
      last_frame.roll_score(FINAL_ROLL) + TEN_PINS_DOWN
    else
      @frames.key?(frame_no + 1) ? @frames[frame_no + 1].roll_score(FIRST_ROLL) + TEN_PINS_DOWN : 0
    end
  end
end
