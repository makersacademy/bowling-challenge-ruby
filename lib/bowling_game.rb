# frozen_string_literal: true

class BowlingGame
  FRAME_COUNT = 10
  PIN_COUNT = 10
  attr_reader :frame, :frame_complete, :frame_number, :running_score

  def initialize
    @frame = []
    @frame_complete
    @frame_number = 1
    @running_score = []
  end

  def throw(pins)
    if frame_complete == false
      @frame << pins
      frame_complete
    else
      next_frame
    end
  end

  def frame_total
    @frame.inject(0, :+)
  end

  def overall_score
    @running_score.inject(:+).inject(:+)
  end

  def frame_complete
    if @frame.length == 2
      @frame_complete = true
      next_frame
    elsif @frame[0] == PIN_COUNT
      @frame << 0
      @frame_complete = true
      next_frame
    else
      false
    end
  end

  def next_frame
    @running_score << [@frame[0], @frame[1]]
    @frame.clear
    @frame_number += 1
  end
end
