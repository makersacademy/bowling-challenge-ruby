# frozen_string_literal: true

require 'frame'

class ScoreCard
  LAST_FRAME = 10
  TEN_PINS = 10
  ZERO_SCORE = 0
  SPARE = 1
  STRIKE = 2

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
    @frames.map { |frame_no, frame| current_frame_score(frame_no, frame) }.sum
  end

  private

  def game_complete?
    @frames.count == LAST_FRAME && @frames[LAST_FRAME].frame_complete?
  end

  def last_frame_next?
    @frames.count + 1 == LAST_FRAME
  end

  def current_frame_score(frame_no, frame)
    return 0 unless frame.frame_complete?
    return frame.sum_frame if frame.open_frame?

    process_bonus_frame(frame, frame_no)
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

  def process_bonus_frame(frame, frame_no)
    bonus_type = strike_or_spare(frame)
    bonus_points(frame_no, bonus_type).positive? ? TEN_PINS + bonus_points(frame_no, bonus_type) : ZERO_SCORE
  end

  def strike_or_spare(frame)
    frame.strike_frame? ? STRIKE : SPARE
  end

  def bonus_points(frame_no, rolls_ahead)
    frames_ahead = @frames.select { |frame_key, _frame| frame_key >= frame_no }
    
    frame_scores = frames_ahead.map { |_frame_key, frame| frame.all_rolls }.flatten

    frame_scores = rolls_ahead == SPARE ? frame_scores.drop(2) : frame_scores.drop(1)
    frame_scores.first(rolls_ahead).count == rolls_ahead ? frame_scores.first(rolls_ahead).sum : ZERO_SCORE
  end
end
