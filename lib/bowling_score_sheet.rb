# frozen_string_literal: true

require_relative 'frame'

class BowlingScoreSheet
  def initialize
    @frames = [Frame.new]
  end

  def add_roll(pins)
    add_bonus_to_previous_frames(pins)
    add_score_to_current_frame(pins)
  end

  def all_frames
    @frames
  end

  def complete
    frame_10 = @frames.filter { |frame| frame.round == 10 }
    if frame_10 == []
      false
    elsif frame_10[0].complete == true && frame_10[0].bonuses.zero?
      true
    else
      false
    end
  end

  private

  def add_bonus_to_previous_frames(pins)
    @frames.each do |frame|
      if frame.bonuses.positive? && frame.complete
        frame.total_score += pins
        frame.bonuses -= 1
      end
    end
  end

  def add_score_to_current_frame(pins)
    current_frame = @frames.last
    if current_frame.complete
      new_frame = create_new_frame(current_frame, pins)
      @frames << new_frame
    else
      current_frame.score << pins
      current_frame.total_score += pins
      set_frame_status(current_frame)
      current_frame.complete = true
    end
  end

  def create_new_frame(current_frame, pins)
    new_frame = Frame.new
    new_frame.round = current_frame.round + 1
    new_frame.score = [pins]
    new_frame.total_score = pins
    new_frame.complete = false if pins != 10
    set_frame_status(new_frame)

    new_frame
  end

  def set_frame_status(frame)
    return unless frame.total_score == 10

    if frame.score[0] == 10
      frame.status = 'strike'
      frame.bonuses = 2
    else
      frame.status = 'spare'
      frame.bonuses = 1
    end
  end
end
